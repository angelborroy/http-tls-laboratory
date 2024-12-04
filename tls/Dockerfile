FROM nginx:alpine

# Install OpenSSL
RUN apk add --no-cache openssl

# Remove default nginx config and html
RUN rm -rf /usr/share/nginx/html/* \
    && rm /etc/nginx/conf.d/default.conf

# Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# Copy files
COPY nginx.conf /etc/nginx/conf.d/
COPY html/ /usr/share/nginx/html/
COPY ssl/generate-certs.sh /tmp/
COPY ssl/openssl.cnf /tmp/

# Generate ECDSA certificates
RUN chmod +x /tmp/generate-certs.sh && \
    cd /tmp && \
    ./generate-certs.sh && \
    mv server.* /etc/nginx/ssl/

# Expose HTTPS port
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
