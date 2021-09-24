#!/bin/bash

# BSD 3-Clause License
# Author @sonique6784
# Copyright (c) 2020, sonique6784

function showRaSCSILogo(){
logo="""
    .~~.   .~~.\n
  '. \ ' ' / .'\n
   .╔═══════╗.\n
  : ║|¯¯¯¯¯|║ :\n
 ~ (║|_____|║) ~\n
( : ║ .  __ ║ : )\n
 ~ .╚╦═════╦╝. ~\n
  (  ¯¯¯¯¯¯¯  ) RaSCSI Assistant\n
   '~ .~~~. ~'\n
       '~'\n
"""
echo -e $logo
}

function showMacNetworkWired(){
logo="""
                              .-~-.-~~~-.~-.\n
 ╔═══════╗                  .(              )\n
 ║|¯¯¯¯¯|║                 /               \`.\n
 ║|_____|║>--------------<~               .   )\n
 ║ .  __ ║                 (              :'-'\n
 ╚╦═════╦╝                  ~-.________.:'\n
  ¯¯¯¯¯¯¯\n
"""
echo -e $logo
}

function showMacNetworkWireless(){
logo="""
                              .-~-.-~~~-.~-.\n
 ╔═══════╗        .(       .(              )\n
 ║|¯¯¯¯¯|║  .(  .(        /               \`.\n
 ║|_____|║ .o    o       ~               .   )\n
 ║ .  __ ║  '(  '(        (              :'-'\n
 ╚╦═════╦╝        '(       ~-.________.:'\n
  ¯¯¯¯¯¯¯\n
"""
echo -e $logo
}

VIRTUAL_DRIVER_PATH=/home/pi/images
HFS_FORMAT=/usr/bin/hformat
HFDISK_BIN=/usr/bin/hfdisk
LIDO_DRIVER=~/RASCSI/lido-driver.img
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
GIT_REMOTE=${GIT_REMOTE:-origin}

function initialChecks() {
    currentUser=$(whoami)
    if [ "pi" != "$currentUser" ]; then
        echo "You must use 'pi' user (current: $currentUser)"
        exit 1
    fi

    if [ ! -d ~/RASCSI ]; then
        echo "You must checkout RASCSI repo into /home/pi/RASCSI"
        echo "$ git clone git@github.com:akuker/RASCSI.git"
        exit 2
    fi
}

# install all dependency packages for RaSCSI Service
function installPackages() {
    sudo apt-get update && sudo apt install git libspdlog-dev libpcap-dev genisoimage python3 python3-venv nginx libpcap-dev protobuf-compiler bridge-utils python3-dev libev-dev libevdev2 -y
}

# compile and install RaSCSI Service
function installRaScsi() {
    sudo systemctl stop rascsi

    cd ~/RASCSI/src/raspberrypi
    make clean
    make all CONNECT_TYPE=${CONNECT_TYPE-FULLSPEC}
    sudo make install CONNECT_TYPE=${CONNECT_TYPE-FULLSPEC}

    sudoIsReady=$(sudo grep -c "rascsi" /etc/sudoers)

    if [ $sudoIsReady = "0" ]; then
        sudo bash -c 'echo "
# Allow the web server to restart the rascsi service
www-data ALL=NOPASSWD: /bin/systemctl restart rascsi.service
www-data ALL=NOPASSWD: /bin/systemctl stop rascsi.service
# Allow the web server to reboot the raspberry pi
www-data ALL=NOPASSWD: /sbin/shutdown, /sbin/reboot
" >> /etc/sudoers'
    fi

    sudo systemctl restart rsyslog
    sudo systemctl enable rascsi # optional - start rascsi at boot
    sudo systemctl start rascsi
}

# install everything required to run an HTTP server (Nginx + Python Flask App)
function installRaScsiWebInterface() {
    echo "Compiling the Python protobuf library..."
    [ -f ~/RASCSI/src/web/rascsi_interface.proto ] && rm ~/RASCSI/src/web/rascsi_interface.proto
    protoc -I=/home/pi/RASCSI/src/raspberrypi/ --python_out=/home/pi/RASCSI/src/web/ rascsi_interface.proto

    sudo cp -f ~/RASCSI/src/web/service-infra/nginx-default.conf /etc/nginx/sites-available/default
    sudo cp -f ~/RASCSI/src/web/service-infra/502.html /var/www/html/502.html

    sudo usermod -a -G pi www-data

    sudo systemctl reload nginx

    echo "Installing the rascsi-web.service configuration..."
    sudo cp ~/RASCSI/src/web/service-infra/rascsi-web.service /etc/systemd/system/rascsi-web.service

    sudo systemctl daemon-reload
    sudo systemctl enable rascsi-web
    sudo systemctl start rascsi-web
}

function createImagesDir() {
    if [ -d $VIRTUAL_DRIVER_PATH ]; then
        echo "The $VIRTUAL_DRIVER_PATH directory already exists."
    else
        echo "The $VIRTUAL_DRIVER_PATH directory does not exist; creating..."
        mkdir -p $VIRTUAL_DRIVER_PATH
        chmod -R 775 $VIRTUAL_DRIVER_PATH
    fi
}

function stopOldWebInterface() {
    sudo systemctl stop rascsi-web
    APACHE_STATUS=$(sudo systemctl status apache2 &> /dev/null; echo $?)
    if [ "$APACHE_STATUS" -eq 0 ] ; then
        echo "Stopping old Apache2 RaSCSI Web..."
        sudo systemctl disable apache2
        sudo systemctl stop apache2
    fi
}

function updateRaScsiGit() {
    echo "Updating checked out branch $GIT_REMOTE/$GIT_BRANCH"
    cd ~/RASCSI
    stashed=0
    if [[ $(git diff --stat) != '' ]]; then
        echo 'There are local changes, we will stash and reapply them.'
        git stash
        stashed=1
    fi

    git pull --ff-only

    if [ $stashed -eq 1 ]; then
        echo "Reapplying local changes..."
        git stash apply
    fi
}

function showRaScsiStatus() {
    sudo systemctl status rascsi | tee
}

function showRaScsiWebStatus() {
    sudo systemctl status rascsi-web | tee
}

function createDrive600MB() {
    createDrive 600 "HD600"
}

function createDriveCustom() {
    driveSize=-1
    until [ $driveSize -ge "10" ] && [ $driveSize -le "4000" ]; do
        echo "What drive size would you like (in MB) (10-4000)"
        read driveSize

        echo "How would you like to name that drive?"
        read driveName
    done

    createDrive "$driveSize" "$driveName"
}

function formatDrive() {
    diskPath="$1"
    volumeName="$2"

    if [ ! -x $HFS_FORMAT ]; then
        # Install hfsutils to have hformat to format HFS
        sudo apt-get install hfsutils
    fi

    if [ ! -x $HFDISK_BIN ]; then
        # Clone, compile and install 'hfdisk', partition tool
        git clone git://www.codesrc.com/git/hfdisk.git
        cd hfdisk
        make

        sudo cp hfdisk /usr/bin/hfdisk
    fi

    # Inject hfdisk commands to create Drive with correct partitions
    # https://www.codesrc.com/mediawiki/index.php/HFSFromScratch
    # i                         initialize partition map
    # continue with default first block
    # C                         Create 1st partition with type specified next) 
    # continue with default
    # 32                        32 blocks (required for HFS+)
    # Driver_Partition          Partition Name
    # Apple_Driver              Partition Type  (available types: Apple_Driver, Apple_Driver43, Apple_Free, Apple_HFS...)
    # C                         Create 2nd partition with type specified next
    # continue with default first block
    # continue with default block size (rest of the disk)
    # ${volumeName}             Partition name provided by user
    # Apple_HFS                 Partition Type
    # w                         Write partition map to disk
    # y                         Confirm partition table
    # p                         Print partition map
    (echo i; echo ; echo C; echo ; echo 32; echo "Driver_Partition"; echo "Apple_Driver"; echo C; echo ; echo ; echo "${volumeName}"; echo "Apple_HFS"; echo w; echo y; echo p;) | $HFDISK_BIN "$diskPath"
    partitionOk=$?

    if [ $partitionOk -eq 0 ]; then
        if [ ! -f $LIDO_DRIVER ];then
            echo "Lido driver couldn't be found. Make sure RaSCSI is up-to-date with git pull"
            return 1
        fi

        # Burn Lido driver to the disk
        dd if=$LIDO_DRIVER of="$diskPath" seek=64 count=32 bs=512 conv=notrunc

        driverInstalled=$?
        if [ $driverInstalled -eq 0 ]; then
            # Format the partition with HFS file system
            $HFS_FORMAT -l "${volumeName}" "$diskPath" 1
            hfsFormattedOk=$?
            if [ $hfsFormattedOk -eq 0 ]; then
                echo "Disk created with success."
            else
                echo "Unable to format HFS partition."
                return 4
            fi
        else
            echo "Unable to install Lido Driver."
            return 3
        fi
    else
        echo "Unable to create the partition."
        return 2
    fi
}

function createDrive() {
    if [ $# -ne 2 ]; then
        echo "To create a Drive, volume size and volume name must be provided"
        echo "$ createDrive 600 \"RaSCSI Drive\""
        echo "Drive wasn't created."
        return
    fi

    driveSize=$1
    driveName=$2
    mkdir -p $VIRTUAL_DRIVER_PATH
    drivePath="${VIRTUAL_DRIVER_PATH}/${driveSize}MB.hds"

    if [ ! -f $drivePath ]; then
        echo "Creating a ${driveSize}MB Drive"
        truncate --size ${driveSize}m $drivePath

        echo "Formatting drive with HFS"
        formatDrive "$drivePath" "$driveName"

    else
        echo "Error: drive already exists"
    fi
}

function setupWiredNetworking() {
    echo "Setting up wired network..."

    LAN_INTERFACE=eth0

    echo "$LAN_INTERFACE will be configured for network forwarding with DHCP."
    echo ""
    echo "WARNING: If you continue, the IP address of your Pi may change upon reboot."
    echo "Please make sure you will not lose access to the Pi system."
    echo ""
    echo "Do you want to proceed with network configuration using the default settings? Y/n"
    read REPLY

    if [ "$REPLY" == "N" ] || [ "$REPLY" == "n" ]; then
        echo "Available wired interfaces on this system:"
	ip -o addr show scope link | awk '{split($0, a); print $2}' | grep eth
        echo "Please type the wired interface you want to use and press Enter:"
        read -r SELECTED
        LAN_INTERFACE=$SELECTED
    fi

    if [ $(grep -c "^denyinterfaces" /etc/dhcpcd.conf) -ge 1 ]; then
        echo "WARNING: Network forwarding may already have been configured. Proceeding will overwrite the configuration."
        echo "Press enter to continue or CTRL-C to exit"
        read REPLY
	sudo sed -i /^denyinterfaces/d /etc/dhcpcd.conf
    fi
    sudo echo "denyinterfaces $LAN_INTERFACE" >> /etc/dhcpcd.conf
    echo "Modified /etc/dhcpcd.conf"

    # default config file is made for eth0, this will set the right net interface
    sudo bash -c 'sed s/eth0/'"$LAN_INTERFACE"'/g /home/pi/RASCSI/src/raspberrypi/os_integration/rascsi_bridge > /etc/network/interfaces.d/rascsi_bridge'
    echo "Modified /etc/network/interfaces.d/rascsi_bridge"

    echo "Configuration completed!"
    echo "Please make sure you attach a DaynaPORT network adapter to the RaSCSI configuration."
    echo "Either use the Web UI, or do this on the command line (assuming SCSI ID 6): \"rascsi -ID 6 -t scdp $LAN_INTERFACE\""
    echo ""
    echo "We need to reboot your Pi"
    echo "Press Enter to reboot or CTRL-C to exit"
    read

    echo "Rebooting..."
    sleep 3
    sudo reboot
}

function setupWirelessNetworking() {
    NETWORK="10.10.20"
    IP=$NETWORK.2 # Macintosh or Device IP
    NETWORK_MASK="255.255.255.0"
    CIDR="24"
    ROUTER_IP=$NETWORK.1
    ROUTING_ADDRESS=$NETWORK.0/$CIDR
    WLAN_INTERFACE="wlan0"

    echo "$WLAN_INTERFACE will be configured for network forwarding with static IP assignment."
    echo "Configure your Macintosh or other device with the following:"
    echo "IP Address (static): $IP"
    echo "Router Address: $ROUTER_IP"
    echo "Subnet Mask: $NETWORK_MASK"
    echo "DNS Server: Any public DNS server"
    echo ""
    echo "Do you want to proceed with network configuration using the default settings? Y/n"
    read REPLY

    if [ "$REPLY" == "N" ] || [ "$REPLY" == "n" ]; then
        echo "Available wireless interfaces on this system:"
	ip -o addr show scope link | awk '{split($0, a); print $2}' | grep wlan
        echo "Please type the wireless interface you want to use and press Enter:"
        read -r WLAN_INTERFACE
        echo "Base IP address (ex. 10.10.20):"
        read -r NETWORK
        echo "CIDR for Subnet Mask (ex. '24' for 255.255.255.0):"
        read -r CIDR
        ROUTER_IP=$NETWORK.1
        ROUTING_ADDRESS=$NETWORK.0/$CIDR
    fi


    if [ $(grep -c "^net.ipv4.ip_forward=1" /etc/sysctl.conf) -ge 1 ]; then
        echo "WARNING: Network forwarding may already have been configured. Proceeding will overwrite the configuration."
        echo "Press enter to continue or CTRL-C to exit"
        read REPLY
    else
        sudo bash -c 'echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf'
	echo "Modified /etc/sysctl.conf"
    fi

    sudo iptables --flush
    sudo iptables -t nat -F
    sudo iptables -X
    sudo iptables -Z
    sudo iptables -P INPUT ACCEPT
    sudo iptables -P OUTPUT ACCEPT
    sudo iptables -P FORWARD ACCEPT
    sudo iptables -t nat -A POSTROUTING -o $WLAN_INTERFACE -s $ROUTING_ADDRESS -j MASQUERADE

    # Check if iptables-persistent is installed
    IPTABLES_PERSISTENT=$(dpkg -s iptables-persistent | grep Status | grep -c "install ok")
    if [ $IPTABLES_PERSISTENT -eq 0 ]; then
        sudo apt-get install iptables-persistent --assume-yes
    else
        sudo iptables-save --file /etc/iptables/rules.v4
    fi
    echo "Modified /etc/iptables/rules.v4"

    echo "Configuration completed!"
    echo ""
    echo "Please make sure you attach a DaynaPORT network adapter to the RaSCSI configuration"
    echo "Either use the Web UI, or do this on the command line (assuming SCSI ID 6): \"rascsi -ID 6 -t scdp $WLAN_INTERFACE:$ROUTER_IP/$CIDR\""
    echo ""
    echo "We need to reboot your Pi"
    echo "Press Enter to reboot or CTRL-C to exit"
    read REPLY

    echo "Rebooting..."
    sleep 3
    sudo reboot
}

function reserveScsiIds() {
    sudo systemctl stop rascsi
    echo "WARNING: This will override any existing modifications to rascsi.service!"
    echo "Please type the SCSI ID(s) that you want to reserve and press Enter:"
    echo "The input should be numbers between 0 and 7 separated by commas, e.g. \"0,1,7\" for IDs 0, 1, and 7."
    echo "Leave empty to make all IDs available."
    read -r RESERVED_IDS

    if [[ $RESERVED_IDS = "" ]]; then
        sudo sed -i /^ExecStart=/d /etc/systemd/system/rascsi.service
        sudo sed -i "8 i ExecStart=/usr/local/bin/rascsi" /etc/systemd/system/rascsi.service
    else
        sudo sed -i /^ExecStart=/d /etc/systemd/system/rascsi.service
        sudo sed -i "8 i ExecStart=/usr/local/bin/rascsi -r $RESERVED_IDS" /etc/systemd/system/rascsi.service
    fi

    echo "Modified /etc/systemd/system/rascsi.service"

    sudo systemctl daemon-reload
    sudo systemctl start rascsi
}

function runChoice() {
  case $1 in
          1)
              echo "Installing / Updating RaSCSI Service (${CONNECT_TYPE-FULLSPEC}) + Web interface"
              stopOldWebInterface
              updateRaScsiGit
              createImagesDir
              installPackages
              installRaScsi
              installRaScsiWebInterface
              showRaScsiStatus
              showRaScsiWebStatus
              echo "Installing / Updating RaSCSI Service (${CONNECT_TYPE-FULLSPEC}) + Web interface - Complete!"
          ;;
          2)
              echo "Installing / Updating RaSCSI Service (${CONNECT_TYPE-FULLSPEC})" 
              updateRaScsiGit
              createImagesDir
              installPackages
              installRaScsi
              showRaScsiStatus
	      echo "Installing / Updating RaSCSI Service (${CONNECT_TYPE-FULLSPEC}) - Complete!"
	  ;;
          3)
              echo "Creating a 600MB drive"
              createDrive600MB
              echo "Creating a 600MB drive - Complete!"
          ;;
          4)
              echo "Creating a custom drive"
              createDriveCustom
              echo "Creating a custom drive - Complete!"
          ;;
          5)
              echo "Configuring wired network bridge"
              showMacNetworkWired
	      setupWiredNetworking
              echo "Configuring wired network bridge - Complete!"
          ;;
          6)
              echo "Configuring wifi network bridge"
	      showMacNetworkWireless
              setupWirelessNetworking
              echo "Configuring wifi network bridge - Complete!"
          ;;
          7)
              echo "Reserving SCSI IDs"
	      reserveScsiIds
              showRaScsiWebStatus
              echo "Reserving SCSI IDs - Complete!"
          ;;
          -h|--help|h|help)
              showMenu
          ;;
          *)
              echo "${1} is not a valid option, exiting..."
              exit 1
      esac
}

function readChoice() {
   choice=-1

   until [ $choice -ge "0" ] && [ $choice -le "7" ]; do
       echo -n "Enter your choice (0-7) or CTRL-C to exit: "
       read -r choice
   done

   runChoice "$choice"
}

function showMenu() {
    echo ""
    echo "Choose among the following options:"
    echo "INSTALL/UPDATE RASCSI (${CONNECT_TYPE-FULLSPEC} version)"
    echo "  1) install or update RaSCSI Service + Web Interface"
    echo "  2) install or update RaSCSI Service"
    echo "CREATE HFS FORMATTED (MAC) IMAGE WITH LIDO DRIVERS"
    echo "** For the Mac Plus, it's better to create an image through the Web Interface **"
    echo "  3) 600MB drive (suggested size)"
    echo "  4) custom drive size (up to 4000MB)"
    echo "NETWORK ASSISTANT"
    echo "  5) configure network forwarding over Ethernet (DHCP)"
    echo "  6) configure network forwarding over WiFi (static IP)" 
    echo "MISCELLANEOUS"
    echo "  7) reserve SCSI IDs"
}

# parse arguments
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -c | --connect_type)
            CONNECT_TYPE=$VALUE
            ;;
	-r | --run_choice)
	    RUN_CHOICE=$VALUE
	    ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            exit 1
            ;;
    esac
    case $VALUE in
        FULLSPEC | STANDARD | 1 | 2 | 3 | 4 | 5 | 6 | 7)
            ;;
        *)
            echo "ERROR: unknown option \"$VALUE\""
	    exit 1
            ;;
    esac
    shift
done

showRaSCSILogo
initialChecks

if [ -z "${RUN_CHOICE}" ]; then # RUN_CHOICE is unset, show menu
    showMenu
    readChoice
else
    runChoice "$RUN_CHOICE"
fi
