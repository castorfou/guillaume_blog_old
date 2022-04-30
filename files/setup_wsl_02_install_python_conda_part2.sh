echo "configure base"
conda install mamba -n base -c conda-forge
mamba init
mamba install nb_conda_kernels
mamba install -c conda-forge jupyterlab jupyterlab-git
tee -a ~/.bashrc << EOF
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
EOF
