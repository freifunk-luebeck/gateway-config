#!/bin/sh

wget --no-clobber --recursive  --reject-regex "/[debug|nightly]/*" firmware.ffhl.de
cp -r firmware.ffhl.de /var/www/firmware
chown -R www-data:www-data /var/www/firmware