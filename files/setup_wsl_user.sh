#!/bin/bash

echo "1. setup wsl-vpnkit"
if grep -Fxq "wsl-vpnkit" ~/.profile
then
    # code if found
	echo "   wsl-vpnkit already setup"
else
    # code if not found
	echo 'wsl.exe -d wsl-vpnkit service wsl-vpnkit start' >> ~/.profile
fi
wsl.exe -d wsl-vpnkit service wsl-vpnkit start
source ./.bashrc
echo

echo "2. create ssh key to copy to gitlab"
. /etc/lsb-release
if [ ! -e ".ssh/id_rsa.pub" ]; then
		ssh-keygen -t rsa -b 4096 -C "WSL2 ubuntu $DISTRIB_RELEASE"
		cat .ssh/id_rsa.pub
		echo "copy this content to gitlab > preferences > SSH Keys"
		read -p "Press any key to resume ..."
fi
echo

echo "3. update certificates"
git clone git@gitlab.michelin.com:devops-foundation/devops_environment.git /tmp/devops_environment
sudo cp /tmp/devops_environment/certs/* /usr/local/share/ca-certificates/
sudo update-ca-certificates
rm -rf /tmp/devops_environment
echo

echo "4. update apt sources with artifactory"
echo 'Acquire { http::User-Agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:13.37) Gecko/20100101 Firefox/31.33.7"; };' | sudo tee /etc/apt/apt.conf.d/90globalprotectconf
sudo sed -i 's,http://archive.ubuntu.com/ubuntu,https://artifactory.michelin.com/artifactory/ubuntu-archive-remote,g' /etc/apt/sources.list
sudo sed -i 's,http://security.ubuntu.com/ubuntu,https://artifactory.michelin.com/artifactory/ubuntu-archive-remote,g' /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y
echo

echo "5. automount secured vbox"
sudo apt install -y autofs
mkdir -p ~/vbox
if ! grep -Fxq "vbox" /etc/auto.master
then
sudo tee -a /etc/auto.master << EOF
/home/$USER/vbox            /etc/vbox.autofs        --timeout=30 browse
EOF
fi
if [ ! -e "/etc/vbox.autofs" ]; then
sudo tee /etc/vbox.autofs << EOF
janus   -fstype=drvfs,uid=1000,gid=1000 :Z:
cho     -fstype=drvfs,uid=1000,gid=1000 :Y:
EOF
echo "`whoami` ALL=(ALL) NOPASSWD: /usr/sbin/service" | sudo tee /etc/sudoers.d/`whoami` && sudo chmod 0440 /etc/sudoers.d/`whoami`
fi
sudo service autofs start
if ! grep -Fxq "autofs" ~/.bashrc
then
echo 'sudo /usr/sbin/service autofs start' >> ~/.bashrc
fi
echo

echo "6. install conda and configure base"
if [ $DISTRIB_RELEASE == "22.04" ]
then
echo 'bug SSL with ubuntu 22.04 - https://bugs.launchpad.net/ubuntu/+source/openssl/+bug/1963834/comments/7'
sudo tee -a /etc/ssl/openssl.cnf << EOF
[openssl_init]
ssl_conf = ssl_sect

[ssl_sect]
system_default = system_default_sect

[system_default_sect]
Options = UnsafeLegacyRenegotiation
EOF
fi
if [ ! -e "~/.condarc" ]; then
tmp_dir=$(mktemp -d )
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P $tmp_dir
sudo bash $tmp_dir/Miniconda3-latest-Linux-x86_64.sh -f -b -p ~/miniconda
~/miniconda/bin/conda init
# create a config file
tee ~/.condarc << EOF
ssl_verify: false
shortcuts: false
report_errors: false
EOF
source ./.bashrc
conda install mamba -n base -c conda-forge
mamba init
mamba install nb_conda_kernels
mamba install -c conda-forge jupyterlab jupyterlab-git
tee -a ~/.bashrc << EOF
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
EOF
fi
