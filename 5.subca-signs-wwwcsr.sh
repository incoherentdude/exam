#sign the www certificates
cd /home/iacsd/subca/
openssl ca -config subca.cnf -extensions server_cert -days 375 -notext -md sha256 -in csr/www.shuhari.local.csr.pem -out certs/www.shuhari.local.cert.pem

scp /home/iacsd/subca/certs/www.shuhari.local.cert.pem iacsd@192.168.244.57:/home/www/certs/
