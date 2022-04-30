echo "config files in git v2"
sudo mkdir -p /.cfg
sudo chown $USER:users /.cfg
git init --bare /.cfg
config='/usr/bin/git --git-dir=/.cfg/ --work-tree=/'
$config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=/.cfg/ --work-tree=/'" >> $HOME/.bash_aliases
cd
source .bashrc
config config --global user.email "guillaume.ramelet@michelin.com"
config config --global user.name "guillaume"
config remote add origin git@gitlab.michelin.com:janus/dotfiles.git
config fetch
cd
config add .bashrc
config commit -m 'init with .bashrc'

config branch GR_WSL2_ubuntu22.04
config checkout GR_WSL2_ubuntu22.04
config push --set-upstream origin GR_WSL2_ubuntu22.04
