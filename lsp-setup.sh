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
elif [ "${1}" == "js" ]; then
    nodenv install $NODENV_VERSION
    nodenv global $NODENV_VERSION
    vim -c "set ft=javascript" -c "LspInstallServer"
elif [ "${1}" == "ts" ]; then
    nodenv install $NODENV_VERSION
    nodenv global $NODENV_VERSION
    vim -c "set ft=typescript" -c "LspInstallServer"
else
    echo "Usage: lsp-setup.sh {python,php}"
fi
