#!/bin/bash

yum -y install awslogs

cat <<'EOF'>> /etc/awslogs/awslogs.conf
[/var/log/secure]
datetime_format = %b %d %H:%M:%S
file = /var/log/secure
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = /var/log/secure
[/var/log/audit/audit.log]
datetime_format = %b %d %H:%M:%S
file = /var/log/audit/audit.log
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = /var/log/audit/audit.log
EOF

chkconfig --add awslogs
chkconfig awslogs on
service awslogs restart
