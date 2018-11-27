#!/bin/bash
##export http_proxy=http://88429:Tomochi6@exaproxy.exa-corp.co.jp:8080
##export https_proxy=http://88429:Tomochi6@exaproxy.exa-corp.co.jp:8080
export http_proxy=http://exaproxy.exa-corp.co.jp:8080
export https_proxy=http://exaproxy.exa-corp.co.jp:8080
##sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo -e HTTP_PROXY=exaproxy.exa-corp.co.jp:8080 -e HTTPS_PROXY=exaproxy.exa-corp.co.jp:8080
sudo wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
sudo yum -y install cf-cli
##export CF_STARTUP_TIMEOUT=30
##curl http://api.run.pivotal.io/
cf login -a api.run.pivotal.io -u tomoyuki-ito@exa-corp.co.jp -p P@ssw0rd
##cf login -a api.run.pivotal.io
cd kantan_resource/kantanPro/target/
cf push kantanPro-0.0.1-SNAPSHOT.jar -t 30