# mTLS Configuration with NGINX

There are three files in the working directory:

1. `Dockerfile` - Contains the container build instructions
2. `nginx.conf` - Contains the Nginx server configuration
3. `html/index.html` - Contains the welcome page content
4. `ssl/generate-certs.sh` - Contains the `openssl` commands to create certificates
5. `ssl/openssl.cnf` - Contains the `openssl` configuration for the script

To build and run:

```bash
# Build the container
docker build . -t nginx-mtls

# Run the container
docker run -p 443:443 --name nginx-mtls nginx-mtls

# Extract client certificates for testing
docker cp nginx-mtls:/etc/nginx/ssl/client.crt .
docker cp nginx-mtls:/etc/nginx/ssl/client.key .
docker cp nginx-mtls:/etc/nginx/ssl/ca.pem .
```

To test the mTLS setup, you can use curl:

```bash
curl --cacert ca.pem \
     --cert client.crt \
     --key client.key \
     https://localhost
```

Key features of this mTLS setup:

1. Creates a complete PKI infrastructure:
   - Certificate Authority (CA)
   - Server certificate
   - Client certificate
2. Uses TLS 1.3 with ECDSA certificates (secp384r1 curve)
3. Enforces client certificate verification
4. Includes security headers
5. Adds custom headers to show client certificate information

Important notes:

1. This setup generates all certificates during build time for demonstration
2. In production, you should manage certificates separately and mount them as volumes
3. The client needs both the client certificate and private key to connect
4. All certificates are ECDSA-based for better performance
5. Client certificates must be signed by the same CA