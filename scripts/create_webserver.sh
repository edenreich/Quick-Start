#!/usr/bin/env bash

echo "...................................."
echo ".......Creating the Webserver......."
echo "...................................."

echo "creating server $1..."
echo 'server {
      	listen 80;
      	server_name '$1';
      	root /var/www/;
      	index index.php index.html index.htm;

      	location / {
            try_files $uri $uri/ /index.php$is_args$args;
        }

        error_page 404 /404.html;
        error_page 500 502 503 504 /50x.html;
        
        location = /50x.html {
            root /usr/share/nginx/html;
        }

        location ~ \.php$ {
            try_files $uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location ~ /\.ht {
            deny all;
        }
    }' > /etc/nginx/sites-available/$1
echo "done!"

echo "enabling the webserver..."
    ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
echo "done!"

echo "restarting nginx..."
	sudo service nginx restart
echo "done!"

echo "task completed!"

