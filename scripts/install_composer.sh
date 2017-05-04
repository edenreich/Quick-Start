#!/usr/bin/env bash

echo "................................."
echo ".......Installing Composer......."
echo "................................."

echo "installing..."
curl -sS https://getcomposer.org/installer | php
echo "done!"

echo "making composer globally executable..."
sudo mv composer.phar /usr/local/bin/composer
echo "done!"


echo "task completed!"