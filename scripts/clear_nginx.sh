#!/usr/bin/env bash

echo "........................................"
echo ".......Removing Default Webserver......."
echo "........................................"

rm -f /etc/nginx/sites-enabled/*
rm -f /etc/nginx/sites-available/*