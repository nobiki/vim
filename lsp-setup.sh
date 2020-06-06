#!/bin/bash -eu
cd $(dirname `realpath $0`)

NODENV_VERSION=14.3.0

if [ "${1}" == "python" ]; then
    sudo apt update
    sudo apt install -y build-essential python3-venv python3-dev
    vim -c "set ft=python" -c "LspInstallServer"
elif [ "${1}" == "php" ]; then
    nodenv install $NODENV_VERSION
    nodenv global $NODENV_VERSION
    vim -c "set ft=php" -c "LspInstallServer"
else
    echo "Usage: lsp-setup.sh {python,php}"
fi
