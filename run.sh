#!/bin/bash

docker run --name haproxy -d -p 8088:80 -p 9443:443 -p 5555:5555 -v $(pwd)/haproxy.cfg:/etc/haproxy/haproxy.cfg -v $(pwd)/receiver.crt:/usr/local/etc/haproxy/certs/receiver.crt haproxy:3.0.2