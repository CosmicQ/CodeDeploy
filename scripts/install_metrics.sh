#!/bin/bash

yum -y install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -o /usr/local/bin/cloud.zip -O
unzip /usr/local/bin/cloud.zip
rm -f /usr/local/bin/cloud.zip

cat <<'EOF'>> /var/spool/cron/root
*/5 * * * * /usr/local/bin/aws-scripts-mon/mon-put-instance-data.pl --disk-space-used --disk-space-avail --mem-used --mem-avail --swap-used --disk-path=/
EOF
