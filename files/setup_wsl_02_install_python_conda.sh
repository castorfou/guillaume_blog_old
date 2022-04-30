echo "install conda and configure base"
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
