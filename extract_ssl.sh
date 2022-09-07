#! /bin/bash

#---------REMOVE CLUTTER-----------
rm -rf *.txt

#---------GET KEY AND CRT------------
#extract key from fpx
openssl pkcs12 -in *.pfx -nocerts -out enc.key -passin pass:##Welcome123 -passout pass:asdf;

#unencrypt private key
openssl rsa -in enc.key -out creativedrive.key -passin pass:asdf; rm enc.key;

#extract crt from pfx
openssl pkcs12 -in *.pfx -out creativedrive.crt -nokeys -clcerts -passin pass:##Welcome123

#---------VERIFY CERT AND KEY------------
openssl x509 -noout -modulus -in creativedrive.crt | openssl md5; openssl rsa -noout -modulus -in creativedrive.key | openssl md5

# --------APPEND AUTHORITY CRT WITH COMPNAY CRT (CHAINED CRT)-------
# remove extension
cat DigiCertCA.crt > DigiCertCA

# remove unused crts
find ./ -name "*.crt" -not -name "creativedrive.crt" -exec rm {} \;

#Append Digicert content and the end of line of normal crt.
cat DigiCertCA >> creativedrive.crt 

# --------FOLDER INSTRUCTIONS AND CLEANUP-------
#c create folder for dropping files of interest
mkdir final
#Drop files of interest.
mv creativedrive.crt final && mv creativedrive.key final


#       chmod +x extract_ssl.sh
#       ./extract_ssl.sh