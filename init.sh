#!/bin/bash

# this part install the latest node version for the eslint used
wget https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-x64.tar.xz
tar -xvf node-v18.18.0-linux-x64.tar.xz
sudo cp -r node-v18.18.0-linux-x64/{bin,include,lib,share} /usr/

# this part create a fake root soo we can call the eslint binary easly
mkdir ~/.fake_root
cp .eslintrc.json package.json tsconfig.json ~/.fake_root/

#
pushd ~/.fake_root

npm i

# Define the alias command
alias_command="alias eslint_etna='~/.fake_root/node_modules/.bin/eslint'"

echo "$alias_command" >> ~/.zshrc
echo "$alias_command" >> ~/.bashrc

popd
