# TLS Security Laboratory Guide

This repository contains a laboratory environment for learning and experimenting with various web security protocols and configurations. The lab is divided into three main sections, each focusing on different security aspects of web communications.

## Repository Structure

```bash
security-lab/
├── http/          # Basic HTTP communication setup
├── tls/           # TLS/SSL secure communication
└── mtls/          # Mutual TLS authentication
```

## Laboratory Sections

### 1. HTTP Laboratory

The HTTP section demonstrates basic web communication without encryption. This serves as a baseline to understand:

- Basic HTTP protocol functionality
- Client-server communication patterns
- Network traffic analysis with plain text
- Security vulnerabilities in unencrypted communication

### 2. TLS Laboratory

The TLS (Transport Layer Security) section introduces secure, encrypted communication. Topics covered include:

- SSL/TLS certificate generation and management
- Server-side certificate configuration
- Client-side certificate verification
- Encrypted traffic analysis
- Common SSL/TLS errors and troubleshooting

### 3. mTLS Laboratory

The mTLS (Mutual TLS) section demonstrates two-way authentication between client and server. Features include:

- Client certificate generation and management
- Server-side client verification configuration
- Bidirectional trust establishment
- Advanced certificate chain validation
- Security best practices for mutual authentication

## Prerequisites

- OpenSSL for certificate management
- Basic understanding of command-line operations
- Web server (e.g., Nginx, Apache) for hosting endpoints
- cURL or similar tool for testing endpoints

## Getting Started

1. Start with the HTTP laboratory to understand basic web communication
2. Progress to the TLS section to learn about secure, encrypted communication
3. Finally, explore mTLS for advanced mutual authentication scenarios

Each directory contains its own README with specific instructions for that section.

## Common Commands

### Certificate Management
```bash
# Generate a private key
openssl genrsa -out private.key 2048

# Create a certificate signing request
openssl req -new -key private.key -out request.csr

# Generate a self-signed certificate
openssl x509 -req -in request.csr -signkey private.key -out certificate.crt
```

### Testing Endpoints
```bash
# Test HTTP endpoint
curl http://localhost

# Test TLS endpoint
curl --cacert ca.pem https://localhost

# Test mTLS endpoint
curl --cacert ca.pem \
     --cert client.crt \
     --key client.key \
     https://localhost
```

## Security Considerations

- All certificates and private keys in this lab are for educational purposes only
- Never use self-signed certificates in production environments
- Keep private keys secure and never commit them to version control
- Regular certificate rotation is recommended in production environments
- Always use strong encryption algorithms and key lengths

## Contributing

Feel free to contribute to this laboratory by:

- Reporting issues
- Suggesting improvements
- Adding new examples
- Improving documentation

## License

This laboratory is provided under the MIT License. See the LICENSE file for details.