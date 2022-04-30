echo "install conda v1"
tmp_dir=$(mktemp -d )
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P $tmp_dir
chmod +x $tmp_dir/Miniconda3-latest-Linux-x86_64.sh
$tmp_dir/Miniconda3-latest-Linux-x86_64.sh -f -b -p ~/miniconda
~/miniconda/bin/conda init
# create a config file
tee ~/.condarc << EOF
ssl_verify: false
shortcuts: false
report_errors: false
EOF
