#!/bin/bash

# Assure parameters are correct.
if [ $# -lt 2 ]; then
    echo "Usage: upload_asset.sh <FILE> <TOKEN>"
    exit 1
fi

repo="xxxbrian/alacritty"
file_path=$1

tag=$(git describe --tags --abbrev=0)

if ! gh release view "$tag"
then
    gh release create --draft "$tag"
fi

gh release upload "$tag" "$file_path"
