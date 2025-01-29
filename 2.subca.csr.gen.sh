#create the directories and give permissions

mkdir /home/iacsd/subca

cd /home/iacsd/subca

mkdir certs crl csr newcerts private 

chmod 700 private/

touch index.txt

touch index.txt.attr

echo 1000 > serial

echo 1000 > crlnumber

#download or copy subca.cnf file assigned with path of /home/iacsd/subca

cp /home/iacsd/subca.cnf /home/iacsd/subca/

sudo apt install openssl

#generate the subca private key and give permissions

openssl genrsa -aes256 -out private/subca.key.pem 4096

chmod 400 private/subca.key.pem

#generate the subca certificate 

openssl req -config subca.cnf -new -sha256 -key private/subca.key.pem -out csr/subca.csr.pem

#export the certificate to rootca machine to get it signed

scp /home/iacsd/subca/csr/subca.csr.pem iacsd@192.168.244.56:/home/iacsd/rootca/subca/csr/
