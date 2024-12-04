#!/bin/sh

# Generate CA key and certificate
openssl ecparam -genkey -name secp384r1 -out ca.key
openssl req -x509 -new -nodes -key ca.key -sha384 -days 365 -out ca.pem -config openssl.cnf -subj "/CN=My Own CA"

# Generate server key and CSR
openssl ecparam -genkey -name secp384r1 -out server.key
openssl req -new -key server.key -out server.csr -config openssl.cnf

# Sign server certificate with CA
openssl x509 -req -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out server.crt -days 365 -sha384 \
    -extensions v3_req -extfile openssl.cnf

# Generate client key and CSR
openssl ecparam -genkey -name secp384r1 -out client.key
openssl req -new -key client.key -out client.csr -config openssl.cnf -subj "/CN=client"

# Sign client certificate with CA
openssl x509 -req -in client.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out client.crt -days 365 -sha384

# Clean up CSR files
rm *.csr *.srl
