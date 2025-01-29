#sign the subca certificate using rootca private key

#sign the subca certificate using rootca private key

openssl ca -config /home/iacsd/rootca/rootca.cnf -extensions v3_intermediate_ca -days 3560 -notext -md sha256 -in /home/iacsd/rootca/subca/csr/subca.csr.pem -out /home/iacsd/rootca/subca/certs/subca.cert.pem

# Verify the new certificate files
md5sum /home/iacsd/rootca/newcerts/1000.pem /home/iacsd/rootca/subca/certs/subca.cert.pem

# Secure copy (scp) the newly created certificate to another server
scp /home/iacsd/rootca/subca/certs/subca.cert.pem iacsd@192.168.80.101:/home/iacsd/subca/certs/
