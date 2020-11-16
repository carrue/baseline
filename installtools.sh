#!/bin/bash
# Original source: https://github.com/nahamsec/bbht/blob/master/install.sh
# Edited to better fit my needs



sudo apt -y update && sudo apt -y upgrade
sudo apt install -y build-essential       # Informational list of build-essential packages
sudo apt install -y git                   # git versioning control
sudo apt install -y jq                    # JSON processor
sudo apt install -y libcurl4-openssl-dev  # Development files and documentation for libcurl (OpenSSL flavour)
sudo apt install -y libffi-dev            # Foreign Function Interface library (development files)
sudo apt install -y libgmp-dev            # Multiprecision arithmetic library developers tools
sudo apt install -y libldns-dev           # ldns library for DNS programming
sudo apt install -y libssl-dev            # Secure Sockets Layer toolkit - development files
sudo apt install -y libxml2               # GNOME XML library
sudo apt install -y libxml2-dev           # Development files for the GNOME XML library
sudo apt install -y libxslt1-dev          # XSLT 1.0 processing library - development kit
sudo apt install -y python3-pip           # Python package installer
sudo apt install -y python-dev            # Not found !!!!!
sudo apt install -y python-dnspython      # DNS toolkit for Python.
sudo apt install -y python-setuptools     # Python Distutils Enhancements
sudo apt install -y rename                # Perl extension for renaming multiple files
sudo apt install -y ruby-dev              # Header files for compiling extension modules for Ruby (default version)
sudo apt install -y ruby-full             # Ruby full install
sudo apt install -y zlib1g-dev            # Compression library - development
sudo apt install -y arp-scan              # ARP protocol discover and fingerprint
sudo apt install -y awscli                # Cli aws
sudo apt install -y masscan               # TCP port scanner
sudo apt install -y netcat                # Tcpip swiss army knife
sudo apt install -y netdiscover           # Active/passive network address scanner using ARP requests
sudo apt install -y net-tools             # Installs arp, ifconfig, netstat, rarp, nameif and route
sudo apt install -y nmap                  # Network mapper
sudo apt install -y snap                  # install snap


# install homebrew
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

# Install amass
brew tap caffix/amass
brew install amass

#install exploit db
git clone https://github.com/offensive-security/exploitdb.git ~/tools/exploit-database
cd ~/tools/exploit-database searchsploit -u

#install twint
git clone --depth=1 https://github.com/twintproject/twint.git ~/tools/twint
pip3 install ~/tools/twint -r requirements.txt

#install EyeWitness
git clone https://github.com/FortyNorthSecurity/EyeWitness.git ~/tools/eyewitness

#install nikto
git clone https://github.com/sullo/nikto.git ~/tools/nikto
chmod +x ~/tools/nikto/program/nikto.pl


# Tools/Commands Removed
# -------------
# sudo apt install -y python-pip            # Not found!!!
# sudo apt install -y xargs                 # Not found!!!!
# sudo apt install -y amass                 # In-depth DNS Enumeration and Network Mapping. Using Homebrew now.
# sudo apt install -y exploitdb             # Searchable exploit database archive
# sudo apt install -y sublist3r             # Subdomain enumeration tool
# git clone https://github.com/nahamsec/lazys3.git            # not yet
# git clone https://github.com/tomdev/teh_s3_bucketeers.git   # not yet
