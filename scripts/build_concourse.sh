#!/bin/bash
mkdir ~/.ssh
touch ~/.ssh/github_id_rsa
cp kantan_pipeline_resource/config ~/.ssh/
echo "${GITHUB_PRIVATE_KEY}" > ~/.ssh/github_id_rsa
chmod 0600 ~/.ssh/github_id_rsa
chmod 0600 ~/.ssh/config

#mavenリポジトリ変更
rm -rf ~/.m2/
ln -fs kantan_module_resource/m2 ~/.m2
chmod 775 -R kantan_module_resource/m2
workpath=`pwd`

cd $workpath/kantan_resource/kantanPro/kantanPro

mvn install spring-boot:repackage -Dmaven.test.skip=true -Dhttp.proxyHost=$PROXY_URL -Dhttp.proxyPort=$PROXY_PORT -Dhttps.proxyHost=$PROXY_URL -Dhttps.proxyPort=$PROXY_PORT

cd $workpath
git clone git@github.com:tomooxy/concourse_module.git k_source
cp kantan_resource/kantanPro/kantanPro/target/kantanPro-0.0.1-SNAPSHOT.jar k_source/modules
cd k_source/modules
git add kantanPro-0.0.1-SNAPSHOT.jar

#git add target/kantanPro-0.0.1-SNAPSHOT.jar
git config --global user.name "conchan"
git config --global user.email "tomoyuki-ito@exa-corp.co.jp"
git commit -m "new build!"
git push