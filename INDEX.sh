# /system/bin/bash
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bug-hunt</title>
</head>
# Title: Bug Hunt
# Description: Script to install various bug hunting tools on Termux
# Exit immediately if a command exits with a non-zero status
set -e setup all-exsplits && tools for Bug hunt & username: <Bughunter> passwd: <Bughunt>
run c/c++ test config-display-overlay background color#00ff234fff title name:Bug hunt { color#000fff557
    'border: solid border color: Blue font: opendyslexic font color:dark green background color:Black.
    Setting: 'tool luancher slection screen' { settind: 'exsploit luancher slection screen' setting: 'clock' setting: 'file management detaled list view' tool: 'logger'
[Display]
overlay_background_color = #00ff234fff
title_name = Bug-hunt
title_color = #000fff557
border_style = solid
border_color = Blue
font = opendyslexic
font_color = dark green
background_color = Black

[Tools]
tool_launcher_selection_screen = true
exploit_launcher_selection_screen = true
clock_display = true
file_management_detailed_list_view = true
logger_enabled = true
#include <iostream>
#include <string>

void setupDisplay() {
    std::string overlay_background_color = "#00ff234fff";
    std::string title_name = "Bug hunt";
    std::string title_color = "#000fff557";
    std::string border_style = "solid";
    std::string border_color = "Blue";
    std::string font = "opendyslexic";
    std::string font_color = "dark green";
    std::string background_color = "Black";

    // Simulate setting up the display
    std::cout << "Setting up display with the following properties:" << std::endl;
    std::cout << "Overlay Background Color: " << overlay_background_color << std::endl;
    std::cout << "Title: " << title_name << std::endl;
    std::cout << "Title Color: " << title_color << std::endl;
    std::cout << "Border Style: " << border_style << std::endl;
    std::cout << "Border Color: " << border_color << std::endl;
    std::cout << "Font: " << font << std::endl;
    std::cout << "Font Color: " << font_color << std::endl;
    std::cout << "Background Color: " << background_color << std::endl;
}

int main() {
    setupDisplay=(-y);
    return 0;
}

# Update and upgrade Termux packages
pkg update -y && pkg upgrade -y

# Install necessary tools
pkg install -y git curl wget python python2 ruby

# GitHub base URL
GITHUB_BASE_URL="https://github.com/user"

# Function to clone and install a tool
install_tool($1) {
    local tool_Bug-hunt repo=$1
    git clone "${GITHUB_BASE_URL}/${tool_Bug-hunt repo}.git"
    cd "${tool_Bug-hunt repo}"
    chmod +x install.sh
    ./install.sh
    cd ..
}

# Install tools
install_tool "file-chasser"
install_tool "netripper"
install_tool "net-trace"
install_tool "log-trace"
install_tool "kernel-trace"
install_tool "endpoint-hunter"
install_tool "code-bracker"

# Install Metasploit
pkg install -y unstable-repo
pkg install -y metasploit

# Install TheFatRat
git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
chmod +x setup.sh
./setup.sh
cd ..

# Install Bruteforce tools
pkg install -y hydra ncrack john

# Uncomment the following lines to install ImageMagick and process images
# pkg install -y imagemagick
# convert input_image.png -resize 800x600 output_image.png

# Update and install necessary packages
sudo apt update
sudo apt install -y curl wget git vagrant packer python3-pip

# Create a workspace for Metasploitable3
mkdir metasploitable3-workspace
cd metasploitable3-workspace

# Download and start Metasploitable3 using Vagrant
curl -O https://raw.githubusercontent.com/rapid7/metasploitable3/master/Vagrantfile
vagrant up

# Build the Metasploitable3 environment with Packer
TMPDIR=/var/tmp ./build.sh packer build --only=virtualbox-iso ./packer/templates/windows_2008_r2.json

# Set up TheFatRat tools
cd ..
git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
chmod +x setup.sh
sudo bash ./setup.sh
chmod +x chk_tools 
./chk_tools
image: 30×20px
bash start.sh

# Set up Kraken
cd ..
git clone https://github.com/jasonxtn/kraken.git
cd kraken
pip3 install -r requirements.txt
chmod +x chk_tools
python kraken.py
image: 30×20px
bash start.sh

# Install bruteforce tools
sudo apt install -y hydra ncrack john

# Run start.sh script
bash start.sh  # or `./start.sh`

# Build a package (if needed)
# ./termux-packages/build-package.sh ../packages/package-to-build
# ./start-builder.sh ./build-package.sh name-of-package
# Update and install necessary packages
sudo apt update
sudo apt install -y curl wget git vagrant packer python3-pip

# Create a workspace for Metasploitable3
mkdir metasploitable3-workspace
cd metasploitable3-workspace

# Download and start Metasploitable3 using Vagrant
curl -O https://raw.githubusercontent.com/rapid7/metasploitable3/master/Vagrantfile
vagrant up

# Build the Metasploitable3 environment with Packer
TMPDIR=/var/tmp ./build.sh packer build --only=virtualbox-iso ./packer/templates/windows_2008_r2.json

# Set up TheFatRat tools
cd ..
git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
chmod +x setup.sh
sudo bash ./setup.sh
chmod +x chk_tools 
./chk_tools
image: 30×20px
bash start.sh

# Set up Kraken
cd ..
git clone https://github.com/jasonxtn/kraken.git
cd kraken
pip3 install -r requirements.txt
chmod +x chk_tools
python kraken.py
image: 30×20px
bash start.sh

# Install bruteforce tools
sudo apt install -y hydra ncrack john

# Run start.sh script
bash start.sh  # or `./start.sh`

# Build a package (if needed)
# ./termux-packages/build-package.sh ../packages/package-to-build
# ./start-builder.sh ./build-package.sh name-of-package



# Update and install necessary packages
sudo apt update
sudo apt install -y curl wget git vagrant packer python3-pip

# Create a workspace for Bug-hunt

# Build the Bug-hunt environment with Packer
TMPDIR=/var/tmp ./build.sh packer build --only=virtualbox-iso ./packer/templates/windows_2008_r2.json

# Set up TheFatRat tools
cd ..
git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
chmod +x setup.sh
sudo bash ./setup.sh
chmod +x chk_tools 
./chk_tools
bash start.sh

# Set up Kraken
cd ..
git clone https://github.com/jasonxtn/kraken.git
cd kraken
pip3 install -r requirements.txt
chmod +x chk_tools
python kraken.py
bash start.sh

# Install bruteforce tools
sudo apt install -y hydra ncrack john

# Run start.sh script
bash start.sh  # or `./start.sh`

# Build a package (if needed)
# ./termux-packages/build-package.sh ../packages/package-to-build
# ./start-builder.sh ./build-package.sh name-of-packageBuild and Release Folders
bin-debug/
bin-release/
[Bb]in/
[Oo]bj/

# Other files and folders
.settings/java-code-js+arry_object
c/c++object+arry_object
exsploit-triggers+ctl+cli
navigation-ctl+cli
user-interface+ctl+cli
image-interface+ctl+cli
build_system-engine+cli+executables

# Executables
*.swf
*.air
*.exec
*.apk
*.sh
*.js
*.ruby
*.py
*.-uU file_migration-setup «rootsu»

# Project files, i.e. .project, .actionScriptProperties and .flexProperties
# should NOT be excluded as they contain compiler settings and other important
# information for Eclipse / Flash Builder.
<body>
  
</body>

</html>
