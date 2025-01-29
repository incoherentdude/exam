#create required directories,files and give permissions
mkdir /home/iacsd/rootca/

cd /home/iacsd/rootca/

mkdir -p certs crl newcerts private subca/csr subca/certs

chmod 700 private/

touch index.txt

touch index.txt.attr

echo 1000 > serial

echo 1000 > crlnumber

#copy/download the rootca configuration file assigned with path of /home/iacsd/subca

cp /home/iacsd/rootca.cnf /home/iacsd/rootca/

sudo apt install openssl

#generate private key and give permissions

openssl genrsa -aes256 -out private/ca.key.pem 4096

chmod 400 private/ca.key.pem

#create a self signed certificate and give permissions

openssl req -config rootca.cnf -key private/ca.key.pem -new -x509  -days 7300 -sha256 -extensions v3_ca -out certs/ca.cert.pem

chmod 444 certs/ca.cert.pem

