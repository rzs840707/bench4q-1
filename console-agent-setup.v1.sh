#! /bin/bash
########################################################################
#
# console-agent v1 r20150219
#
########################################################################


# Instalacao do JDK e do unzip através do apt-get
apt-get update
apt-get install -y default-jdk unzip

# Instalação do Console e Agente
wget http://download.forge.ow2.org/jaspte/Bench4Q-1.3.0.zip
unzip Bench4Q-1.3.0.zip

touch Bench4Q-1.3/startConsole.sh
touch Bench4Q-1.3/startAgent.sh
echo "java -Duser.country=US -Duser.language=en -cp lib/bench4Q.jar org.bench4Q.Console" > Bench4Q-1.3/startConsole.sh
echo "java -Duser.country=US -Duser.language=en -cp lib/bench4Q.jar org.bench4Q.Agent bench4Q.properties" > Bench4Q-1.3/startAgent.sh

