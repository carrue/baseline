#!/bin/bash
sudo apt -y update && sudo apt -y upgrade
sudo apt install -y build-essential git jq libcurl4-openssl-dev libffi-dev libgmp-dev libldns-dev libssl-dev libxml2 libxml2-dev libxslt1-dev python3-pip python-dev python-dnspython python-setuptools rename ruby-dev ruby-full zlib1g-dev
sudo apt install -y arp-scan awscli masscan netcat netdiscover net-tools nmap snap snapd python3-shodan john

#update path
echo export PATH="$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" >> ~/.bashrc
source ~/.bashrc

#install homebrew
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

#install amass
brew tap caffix/amass
brew install amass

#install exploit db
git clone https://github.com/offensive-security/exploitdb.git ~/tools/exploit-database
~/tools/exploit-database/searchsploit -u

#install twint
git clone https://github.com/twintproject/twint.git ~/tools/twint
pip3 install -r ~/tools/twint/requirements.txt

#install EyeWitness
git clone https://github.com/FortyNorthSecurity/EyeWitness.git ~/tools/eyewitness

#install nikto
git clone https://github.com/sullo/nikto.git ~/tools/nikto
chmod +x ~/tools/nikto/program/nikto.pl

#install metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
