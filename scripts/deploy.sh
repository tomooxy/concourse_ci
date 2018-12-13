#!/bin/bash
#unset no_proxy
#unset http_proxy
#unset https_proxy
#export HTTP_PROXY=http://exaproxy.exa-corp.co.jp:8080
#export HTTPS_PROXY=http://exaproxy.exa-corp.co.jp:8080
##sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo -e HTTP_PROXY=exaproxy.exa-corp.co.jp:8080 -e HTTPS_PROXY=exaproxy.exa-corp.co.jp:8080
#yum -y install wget
#wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
#yum -y install cf-cli
#export CF_STARTUP_TIMEOUT=30
#curl https://api.run.pivotal.io/v2/info
#cf set-env http_proxy "exaproxy.exa-corp.co.jp:8080"
#cf set-env https_proxy "exaproxy.exa-corp.co.jp:8080"
touch key
echo "${MY_SECRET}" > key
chmod 0600 key
scp -oStrictHostKeyChecking=no -i key kantan_module_resource/modules/kantanPro-0.0.1-SNAPSHOT.jar vagrant@192.168.33.10:/home/vagrant/concourse/module/

ssh -oStrictHostKeyChecking=no -i key vagrant@192.168.33.10 <<EOC
cd /home/vagrant/concourse/module/
cf login -a api.run.pivotal.io -u tomoyuki-ito@exa-corp.co.jp -p P@ssw0rd
cf push kantanPro -p kantanPro-0.0.1-SNAPSHOT.jar -b https://github.com/cloudfoundry/java-buildpack.git
EOC

#cf login -a api.run.pivotal.io -u tomoyuki-ito@exa-corp.co.jp -p P@ssw0rd
##cf login -a api.run.pivotal.io
#cd kantan_resource/kantanPro/target/
#cf push kantanPro-0.0.1-SNAPSHOT.jar -t 30