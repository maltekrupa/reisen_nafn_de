#!/usr/bin/env bash

set -e

find ./static -name ".DS_Store" -delete
rm -rf public
hugo --minify --config config.toml
pushd public
rsync -ravl --delete . nafn.de:/var/www/virtual/computer/interrail22.nafn.de/
popd
