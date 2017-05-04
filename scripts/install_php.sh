#!/usr/bin/env bash

echo "................................"
echo ".......Installing PHP 7.0......."
echo "................................"

echo "Fetching ppa:ondrej/php repository..."
sudo add-apt-repository ppa:ondrej/php
echo "done!"

echo "Updating all repositories..."
sudo apt-get update
echo "done!"

echo "Installing PHP 7.0-mysql module..."
sudo apt-get install -y php7.0-mysql
echo "done!"

echo "Installing PHP 7.0-fpm..."
sudo apt-get install -y php7.0-fpm
echo "done!"

echo "task completed!"