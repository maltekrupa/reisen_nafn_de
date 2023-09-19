#!/usr/bin/env bash

set -e

find ./static -name ".DS_Store" -delete
rm -rf public
hugo --minify --config config.toml
pushd public
rsync -ravl --omit-dir-times --delete ./ staticsites.w0.m.nafn.de:/usr/local/www/reisen
popd
