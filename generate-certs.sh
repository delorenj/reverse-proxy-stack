#!/bin/bash

# Create SSL directory if it doesn't exist
mkdir -p config/ssl

# Generate self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout config/ssl/key.pem \
    -out config/ssl/cert.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=*.${TAILSCALE_HOSTNAME:-localhost}"

# Set proper permissions
chmod 600 config/ssl/key.pem
chmod 644 config/ssl/cert.pem
