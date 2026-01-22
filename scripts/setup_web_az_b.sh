#!/bin/bash
set -e

AZ_LABEL="eu-west-2b"

# Install + start Apache
sudo yum install -y httpd
sudo systemctl enable --now httpd

# Write simple homepage
sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head><title>ALB Multi-AZ Demo</title></head>
<body>
  <h1>Hello from ${AZ_LABEL}</h1>
  <p>EC2 behind an Application Load Balancer</p>
</body>
</html>
EOF

sudo systemctl restart httpd
echo "Done. Homepage set to: ${AZ_LABEL}"

