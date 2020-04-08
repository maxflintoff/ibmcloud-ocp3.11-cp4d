#!/usr/bin/env bash

IBM_PROVIDER_RELEASE="https://github.com/IBM-Cloud/terraform-provider-ibm/releases/download"
RELEASE_VER="1.2.5"
if [ "$(uname)" == "Darwin" ]; then
    PLATFORM="darwin"
    PLUGINS_DIR=$HOME/.terraform.d/plugins
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    PLATFORM="linux"
    PLUGINS_DIR=$HOME/.terraform.d/plugins
fi

BINARY_LOCATION=$IBM_PROVIDER_RELEASE"/v"$RELEASE_VER"/"$PLATFORM"_amd64.zip"
echo "Downloading provider from "$BINARY_LOCATION

wget $BINARY_LOCATION
mkdir -p $PLUGINS_DIR
unzip -d $PLUGINS_DIR $PLATFORM"_amd64.zip"
rm $PLATFORM"_amd64.zip"

echo "All known plugins - check if ibm has been installed:"
ls $PLUGINS_DIR

