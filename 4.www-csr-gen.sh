#create the required directories

mkdir -p /home/iacsd/www/certs 
cd /home/iacsd/www/certs

#download or copy subca.cnf file assigned with path of /home/iacsd/www/

#cp /home/iacsd/subca.cnf /home/iacsd/www/

sudo apt install openssl
#generate the private key of www machine and give permissions

openssl genrsa -out www.shuhari.local.key.pem 2048

chmod 400 www.shuhari.local.key.pem

#generate a certificate using subca.cnf file 

openssl req -config subca.cnf -key www.shuhari.local.key.pem -new -sha256 -out www.shuhari.local.csr.pem

#export it to subca machine to get it signed

scp /home/iacsd/www/certs/www.shuhari.local.csr.pem subca@192.168.244.55:/home/iacsd/subca/csr/ 
