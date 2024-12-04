# TLS Configuration with NGINX

There are three files in the working directory:

1. `Dockerfile` - Contains the container build instructions
2. `nginx.conf` - Contains the Nginx server configuration
3. `html/index.html` - Contains the welcome page content
4. `ssl/generate-certs.sh` - Contains the `openssl` commands to create certificates
5. `ssl/openssl.cnf` - Contains the `openssl` configuration for the script

To build and run this configuration:

```bash
# Build the container
docker build . -t nginx-tls

# Run the container
docker run -p 443:443 --name nginx-tls nginx-tls
```

Key security features in this setup:

1. TLS 1.3 only (no support for older versions)
2. ECDSA certificates using secp384r1 curve (more efficient than RSA)
3. Strong security headers
4. HTTP/2 support
5. Self-signed certificates generated during build

Some important points:

- The certificates are self-signed and generated during the build process
- You'll get a browser warning since we're using self-signed certificates
- For production, you should replace the certificates with proper ones from a trusted CA

To access the page, navigate to `https://localhost` in your browser. You'll need to accept the security warning since we're using self-signed certificates.