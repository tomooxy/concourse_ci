#!/bin/bash
export http_proxy=http://exaproxy.exa-corp.co.jp:8080
export https_proxy=http://exaproxy.exa-corp.co.jp:8080
printenv
cat /etc/resolv.conf
cf login -a api.run.pivotal.io -u tomoyuki-ito@exa-corp.co.jp -p P@ssw0rd
cd kantan_resource/kantanPro/target/
cf push kantanPro-0.0.1-SNAPSHOT.jar