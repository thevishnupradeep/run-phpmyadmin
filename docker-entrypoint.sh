#!/bin/sh

# Support for stopping container with `Ctrl+C`

set -e

# Support for Apache web server custom ports: env vars HTTP_PORT (80) and HTTPS_PORT (443)

echo "Port is: $PORT"

sed -i "s/Listen 80/Listen ${PORT:-80}/" /etc/apache2/ports.conf

# Support for UPLOAD_SIZE env var, if specified - will be used instead of default value 128M

test -z $UPLOAD_SIZE || sed -i "s/128M/$UPLOAD_SIZE/g" /var/www/html/.htaccess

# Start Apache as usual

exec apache2-foreground
