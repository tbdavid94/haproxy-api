# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    lsb-release \
    dpkg

# Add the HAProxy 3.0 repository and its signing key
RUN add-apt-repository ppa:vbernat/haproxy-3.0 -y

# Install HAProxy 3.0
RUN apt-get update && apt-get install -y haproxy=3.0.*

# Copy the dataplaneapi .deb file into the container
COPY dataplaneapi_2.9.6_linux_amd64.deb /tmp/

# Install dataplaneapi
RUN dpkg -i /tmp/dataplaneapi_2.9.6_linux_amd64.deb

# Copy the dataplaneapi.yml file to the proper location
COPY dataplaneapi.yml /etc/haproxy/dataplaneapi.yml

# Copy the start script
COPY start_services.sh /usr/local/bin/start_services.sh

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose HAProxy and dataplaneapi default ports
EXPOSE 80 443 5555

# Set the entrypoint to run the start script
ENTRYPOINT ["/usr/local/bin/start_services.sh"]