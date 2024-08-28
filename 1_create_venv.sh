#!/bin/bash
set -euo pipefail

echo "--- Setting noninteractive and updating repos ---"
export DEBIAN_FRONTEND=noninteractive
echo "\$nrconf{restart} = 'l';" > /etc/needrestart/conf.d/90-autorestart.conf
apt-get update

echo "--- Creating Python3 virtual Env ---"
apt install -y python3-venv
apt install -y python3-pip

python3 -m venv venv
source ./venv/bin/activate

echo "--- Installing Python dependencies ---"
pip install -r ./requirements.txt
echo "Run: 'source venv/bin/activate' to activate the venv."
