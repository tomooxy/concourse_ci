#!/bin/bash
mkdir ~/.ssh
touch ~/.ssh/github_id_rsa
cp kantan_pipeline_resource/config ~/.ssh/
echo "${MY_SECRET}" > ~/.ssh/github_id_rsa
chmod 0600 ~/.ssh/github_id_rsa
chmod 0600 ~/.ssh/config

workpath=`pwd`

cd $workpath/kantan_resource/kantanPro

cat src/main/resources/templates/conchan.html

mvn install spring-boot:repackage -Dmaven.test.skip=true -Dhttp.proxyHost=exaproxy.exa-corp.co.jp -Dhttp.proxyPort=8080 -Dhttps.proxyHost=exaproxy.exa-corp.co.jp -Dhttps.proxyPort=8080

cd ../../
git clone git@github.com:tomooxy/concourse_module.git k_source
cp kantan_resource/kantanPro/target/kantanPro-0.0.1-SNAPSHOT.jar k_source/modules
cd k_source/modules
git add kantanPro-0.0.1-SNAPSHOT.jar

#git add target/kantanPro-0.0.1-SNAPSHOT.jar
git config --global user.name "conchan"
git config --global user.email "tomoyuki-ito@exa-corp.co.jp"
git commit -m "new build!"
git push