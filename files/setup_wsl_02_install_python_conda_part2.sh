echo "configure base"
conda install -y mamba -n base -c conda-forge
mamba init
mamba install -y nb_conda_kernels
mamba install -y -c conda-forge jupyterlab jupyterlab-git
tee -a ~/.bashrc << EOF
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
EOF
