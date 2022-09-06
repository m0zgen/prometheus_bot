#!/bin/bash
# Go binary builder, fpm builder
# Created by Y.G., https://sys-adm.in

# Envs
# ---------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $SCRIPT_PATH

BIN_PATH="$SCRIPT_PATH/pkg"


# Funcs
# ---------------------------------------------------\
getDate() {
    date '+%d-%m-%Y_%H-%M-%S'
}

# Gen binaries
makeBin() {

    echo -e "\nBuilding: - $BIN_PATH"

    if [[ ! -d "$BIN_PATH" ]]; then
        mkdir $BIN_PATH
    fi

    env GOOS=linux GOARCH=amd64 go build -o $BIN_PATH
    echo -e "Binary already ready in ${BIN_PATH}\n"

}

# Acts
# ---------------------------------------------------\
makeBin