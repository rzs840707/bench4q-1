#! /bin/bash
########################################################################
#
# databasedb2-setup v1 r20150219
#
########################################################################

# Cofiguração do arquivo /etc/source.list
sed -i 's/^# \(.*partner$\)/\1/g' /etc/apt/sources.list
echo "deb http://archive.canonical.com/ubuntu lucid partner" >> /etc/apt/sources.list

# Instalacao do DB2, do JDK e do unzip através do apt-get
apt-get update
apt-get install -y db2exc default-jdk unzip

# Instalaçã do DB2Generator
wget http://download.forge.ow2.org/jaspte/DB2Generator-1.3.0.zip
unzip DB2Generator-1.3.0.zip

# Configura do DB2Generator
mv DB2\ Generator/db.properties DB2\ Generator/db.properties.orig
touch DB2\ Generator/db.properties
echo "dbname = jdbc:db2://127.0.0.1:50000/BENCH4Q" > DB2\ Generator/db.properties
echo "username = db2inst1" >> DB2\ Generator/db.properties
echo "password = db2inst1" >> DB2\ Generator/db.properties
echo "ebnumber = 500" >> DB2\ Generator/db.properties
echo "itemnumber = 1000" >> DB2\ Generator/db.properties

# Instalação do ServerMon
mkdir ServerMon
cd ServerMon
wget http://download.forge.ow2.org/jaspte/ServerMon-1.0.zip
unzip ServerMon-1.0.zip
cd ..

# Configuração do usuário para acesso ao DB2
echo "db2inst1:db2inst1" | chpasswd

# Criacao do banco de dados bench4q
su - db2inst1 -c <<DB2 db2
create database bench4q
activate db bench4q
terminate
DB2

# Popular base de dados bench4q
java -jar DBPopulate.jar
