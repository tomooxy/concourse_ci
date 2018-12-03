#!/bin/bash
#export MAVEN_OPTS="-DsocksProxyHost=exaproxy.exa-corp.co.jp -DsocksProxyPort=8080"
cd kantan_resource/kantanPro
#mvn package spring-boot:repackage
mvn package spring-boot:repackage -Dmaven.test.skip=true -Dhttp.proxyHost=exaproxy.exa-corp.co.jp -Dhttp.proxyPort=8080 -Dhttps.proxyHost=exaproxy.exa-corp.co.jp -Dhttps.proxyPort=8080
#git clone https://github.com/tomooxy/concourse_test.git k_source
#cp target/kantanPro-0.0.1-SNAPSHOT.jar k_source/kantanPro/target/
#git add k_source/kantanPro/target/kantanPro-0.0.1-SNAPSHOT.jar
git add target/kantanPro-0.0.1-SNAPSHOT.jar
git config --global user.name "conchan"
git config --global user.email "tomoyuki-ito@exa-corp.co.jp"
git commit -m "new build!"
git push origin HEAD