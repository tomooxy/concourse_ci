#!/bin/bash
mkdir ~/.ssh
touch ~/.ssh/github_id_rsa
cp kantan_pipeline_resource/config ~/.ssh/
echo "${MY_SECRET}" > ~/.ssh/github_id_rsa
chmod 0600 ~/.ssh/github_id_rsa
chmod 0600 ~/.ssh/config

yum search java-1.8.0-openjdk
yum -y install java-1.8.0-openjdk

workpath=`pwd`

yum -y install wget
cd /etc/yum.repos.d/
wget http://wing-repo.net/wing/6/EL6.wing.repo
yum -y install git

yum -y install nc nmap

wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
yum install -y apache-maven

#export MAVEN_OPTS="-DsocksProxyHost=exaproxy.exa-corp.co.jp -DsocksProxyPort=8080"
cd $workpath/kantan_resource/kantanPro
#mvn package spring-boot:repackage
mvn package spring-boot:repackage -Dmaven.test.skip=true -Dhttp.proxyHost=exaproxy.exa-corp.co.jp -Dhttp.proxyPort=8080 -Dhttps.proxyHost=exaproxy.exa-corp.co.jp -Dhttps.proxyPort=8080

cd ../../
git clone git@github.com:tomooxy/concourse_test.git k_source
cp kantan_resource/kantanPro/target/kantanPro-0.0.1-SNAPSHOT.jar k_source/kantanPro/target/
cd k_source/kantanPro/target
git add kantanPro-0.0.1-SNAPSHOT.jar

#git add target/kantanPro-0.0.1-SNAPSHOT.jar
git config --global user.name "conchan"
git config --global user.email "tomoyuki-ito@exa-corp.co.jp"
git commit -m "new build!"
git push