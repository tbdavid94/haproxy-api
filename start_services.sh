#!/bin/bash
set -e

# Create the directory for the socket if it doesn't exist
mkdir -p /run/haproxy
chown haproxy:haproxy /run/haproxy

# Start HAProxy in the background
haproxy -f /etc/haproxy/haproxy.cfg &

# Wait for HAProxy to create the admin socket
while [ ! -S /run/haproxy/admin.sock ]; do
  sleep 1
done

# Start dataplaneapi
exec dataplaneapi -f /etc/haproxy/dataplaneapi.yml
