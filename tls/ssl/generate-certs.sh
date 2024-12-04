#!/bin/sh
# Generate ECDSA private key and certificate
openssl ecparam -genkey -name secp384r1 -out server.key
openssl req -new -x509 -key server.key -out server.crt -days 365 -config openssl.cnf

