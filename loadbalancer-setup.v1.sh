#! /bin/bash
########################################################################
#
# loadbalancer-setup v1 r20150219
#
########################################################################


# Instalacao do HAProxy, do JDK e do unzip através do apt-get
apt-get update
apt-get install -y haproxy default-jdk unzip

# Instalação do ClusterMon
mkdir ClusterMon
cd ClusterMon
wget http://download.forge.ow2.org/jaspte/ClusterMon-1.0.zip
unzip ClusterMon-1.0.zip
cd ..

# Configura HAProxy para inicar com o sistema
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy

# Configuração do frontend, backend e admin
wget http://github.com/kerollaine/bench4q/haproxy-conf/haproxy.cfg
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orig
mv haproxy.cfg /etc/haproxy/

# Habilita log
sed -i 's/#$ModLoad\ imudp/$ModLoad\ imudp/g' conf
v='$UDPServerRun\ 514\n$UDPServerAddress\ 127.0.0.1'
sed -i "s/#\$UDPServerRun\ 514/$v/g"

# Reinicia os servicos
/etc/init.d/rsyslog restart
/etc/init.d/haproxy restart
