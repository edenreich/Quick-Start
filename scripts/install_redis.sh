#!/usr/bin/env bash

echo "....................................."
echo ".......Installing Redis-Server......."
echo "....................................."

echo "Installing tcl8.5..."
sudo apt-get install tcl8.5
echo "done!"

echo "Installing build-essential to help installing redis..."
sudo apt-get install build-essential
echo "done!"

echo "Downloading redis-stable..."
wget http://download.redis.io/releases/redis-stable.tar.gz
echo "done!"

echo "untaring the file..."
tar xzf redis-stable.tar.gz
echo "done!"

echo "running redis init file using 'make' command..."
cd redis-stable
make
echo "done!"

echo "running 'make test' for testing(going to take a few min)..."
make test
echo "done!"

echo "installing globally..."
sudo make install
echo "done!"

echo "installing redis background daemon..."
cd utils
sudo ./install_server.sh
echo "done!"


echo "task completed!"