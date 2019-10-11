#!/usr/bin/env bash

# Check If wkhtmltopdf Has Been Installed
if [[ -f /home/vagrant/.homestead-features/wkhtmltopdf ]]; then
    echo "wkhtmltopdf already installed."
    exit 0
fi

export DEBIAN_FRONTEND=noninteractive

touch /home/vagrant/.homestead-features/wkhtmltopdf
chown -Rf vagrant:vagrant /home/vagrant/.homestead-features

apt-get update

# Install wkhtmltopdf and xvfb
apt-get install -y wkhtmltopdf xvfb
echo -e '#!/bin/bash\nxvfb-run -a --server-args="-screen 0, 1920x1080x24" /usr/bin/wkhtmltopdf -q $*' > /usr/bin/wkhtmltopdf.sh
chmod a+x /usr/bin/wkhtmltopdf.sh
ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf

unset DEBIAN_FRONTEND
