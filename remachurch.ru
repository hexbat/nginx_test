##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# https://www.nginx.com/resources/wiki/start/
# https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/
# https://wiki.debian.org/Nginx/DirectoryStructure
#
# In most cases, administrators will remove this file from sites-enabled/ and
# leave it as reference inside of sites-available where it will continue to be
# updated by the nginx packaging team.
#
# This file will automatically load configuration files provided by other
# applications, such as Drupal or Wordpress. These applications will be made
# available underneath a path with that package name, such as /drupal8.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

# Default server configuration
# Virtual Host configuration for example.com
#
# You can move that to a different file under sites-available/ and symlink that
# to sites-enabled/ to enable it.
#

server {
	listen 443 ssl;
	server_name www.remachurch.ru;
	return 301 https://remachurch.ru$request_uri;
ssl_certificate /etc/letsencrypt/live/remachurch.ru/fullchain.pem; # managed by Certbot
ssl_certificate_key /etc/letsencrypt/live/remachurch.ru/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
}

server {
#	listen 8800;
#	listen [::]:8008;
#
	server_name remachurch.ru;
#
	root /var/www/remachurch.ru;
	index index.html;
#
	location / {
#		try_files $uri $uri/ =404;
		proxy_pass http://127.0.0.1:8000/;
	}

    listen 443 ssl; # managed by Certbot
ssl_certificate /etc/letsencrypt/live/remachurch.ru/fullchain.pem; # managed by Certbot
ssl_certificate_key /etc/letsencrypt/live/remachurch.ru/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

}
