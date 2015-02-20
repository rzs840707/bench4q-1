#! /bin/bash
########################################################################
#
# appserver-setup v1 r20150219
#
########################################################################

# Diretório de trabalho
wpath=$(pwd)

# Instalacao do JDK e do unzip através do apt-get
apt-get update
apt-get install -y default-jdk unzip

# Instalação do ClusterMon
mkdir ClusterMon
cd ClusterMon
wget http://download.forge.ow2.org/jaspte/ClusterMon-1.0.zip
unzip ClusterMon-1.0.zip
cd $wpath

# Instalação do servidor Tomcat
wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz
tar -xpzf apache-tomcat-7.0.59.tar.gz

# Configuração da conexão com o banco de dados
wget http://github.com/kerollaine/bench4q/tomcat-conf/context.xml
wget http://github.com/kerollaine/bench4q/tomcat-conf/server.xml
mv $wpath/apache-tomcat-7.0.59/conf/context.xml $wpath/apache-tomcat-7.0.59/conf/context.xml.orig
mv context.xml $wpath/apache-tomcat-7.0.59/conf/
mv $wpath/apache-tomcat-7.0.59/conf/server.xml $wpath/apache-tomcat-7.0.59/conf/server.xml.orig
mv server.xml $wpath/apache-tomcat-7.0.59/conf/

# Instalação do driver JDB do DB2
wget http://iweb.dl.sourceforge.net/project/id2d/jdbc%20drivers/db2jcc.jar
mv db2jcc.jar $wpath/apache-tomcat-7.0.59/lib/

# Inicialização do Tomcat junto com o sistema
sed -i '/exit/d' /etc/rc.local
echo "$wpath/apache-tomcat-7.0.59/bin/startup.sh" >> /etc/rc.local

# Instalação do SUT
wget http://download.forge.ow2.org/jaspte/SUT-1.3.0.zip
unzip SUT-1.3.0.zip
unzip SUT/bench4Q.zip
mv bench4Q $wpath/apache-tomcat-7.0.59/webapps

# Inicia o servidor de tomcat com o SUT instalado
$wpath/apache-tomcat-7.0.59/bin/startup.sh
