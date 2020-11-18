#!/bin/bash

sudo apt -y update && sudo apt -y upgrade
sudo apt install -y build-essential git jq libcurl4-openssl-dev libffi-dev libgmp-dev libldns-dev libssl-dev libxml2 libxml2-dev libxslt1-dev python3-pip python-dev python-dnspython python-setuptools rename ruby-dev ruby-full snap snapd zlib1g-dev

#install homebrew
echo -e '\n\n\033[1m.....Installing Homebrew.....\n\033[0m'
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)
sleep 2

#install go
#if previously install $sudo rm -r /usr/local/go/
echo -e '\n\n\033[1m.....Installing Go.....\n\033[0m'
wget https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.15.5.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
sleep 2

#install arp-scan
echo -e '\n\n\033[1m.....Installing arp-scan.....\n\033[0m'
sudo apt install -y arp-scan
sleep 2

#install awscli
echo -e '\n\n\033[1m.....Installing AWScli.....\n\033[0m'
sudo apt install -y awscli
sleep 2

#install masscan
echo -e '\n\n\033[1m.....Installing masscan.....\n\033[0m'
sudo apt install -y masscan
sleep 2

#install netcat
echo -e '\n\n\033[1m.....Installing netcat.....\n\033[0m'
sudo apt install -y netcat
sleep 2

#install netdiscover
echo -e '\n\n\033[1m.....Installing netdiscover.....\n\033[0m'
sudo apt install -y netdiscover
sleep 2

#install net-tools
echo -e '\n\n\033[1m.....Installing net-tools.....\n\033[0m'
sudo apt install -y net-tools
sleep 2

#install nmap
echo -e '\n\n\033[1m.....Installing nmap.....\n\033[0m'
sudo apt install -y nmap
sleep 2

#install python3-shodan
echo -e '\n\n\033[1m.....Installing python3-shodan.....\n\033[0m'
sudo apt install -y python3-shodan
sleep 2

#install amass
echo -e '\n\n\033[1m.....Installing amass.....\n\033[0m'
brew tap caffix/amass
brew install amass
sleep 2

#install owasp-zap (For xUbuntu 20.04)
echo -e '\n\n\033[1m.....Installing owasp-zap.....\n\033[0m'
echo 'deb http://download.opensuse.org/repositories/home:/cabelo/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:cabelo.list
curl -fsSL https://download.opensuse.org/repositories/home:cabelo/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null
sudo apt update
sudo apt install -y owasp-zap
sleep 2

#install exploitdb
echo -e '\n\n\033[1m.....Installing exploitdb.....\n\033[0m'
git clone https://github.com/offensive-security/exploitdb.git ~/tools/exploit-database
~/tools/exploit-database/searchsploit -u
sleep 2

#install twint
echo -e '\n\n\033[1m.....Installing twint.....\n\033[0m'
git clone https://github.com/twintproject/twint.git ~/tools/twint
pip3 install -r ~/tools/twint/requirements.txt
sleep 2

#install eyewitness
#look in https://github.com/BishopFox/eyeballer
echo -e '\n\n\033[1m.....Installing eyewitness.....\n\033[0m'
git clone https://github.com/FortyNorthSecurity/EyeWitness.git ~/tools/eyewitness
sleep 2

#install nikto
echo -e '\n\n\033[1m.....Installing nikto.....\n\033[0m'
git clone https://github.com/sullo/nikto.git ~/tools/nikto
chmod +x ~/tools/nikto/program/nikto.pl
sleep 2

#install metasploit
echo -e '\n\n\033[1m.....Installing metasploit.....\n\033[0m'
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && sudo ./msfinstall
sleep 2

#install nuclei
#needs go1.14
echo -e '\n\n\033[1m.....Installing nuclei.....\n\033[0m'
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
sleep 2

#install gobuster
echo -e '\n\n\033[1m.....Installing gobuster.....\n\033[0m'
go get -u -v github.com/OJ/gobuster
sleep 2

#install ffuf
echo -e '\n\n\033[1m.....Installing ffuf.....\n\033[0m'
go get -u -v github.com/ffuf/ffuf
sleep 2

#update path
echo export PATH="$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> ~/.bashrc
source ~/.bashrc

#create text file with list of tools installed
cat install.sh | grep '#install' | cut -f 2 -d " " | sort > toolsinstalled.txt

echo -e '\n\n\033[1m.....Done. See toolsinstalled.txt.....\n\n\n\033[0m'
