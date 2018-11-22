#!/bin/bash
export MAVEN_OPTS="-DsocksProxyHost=exaproxy.exa-corp.co.jp -DsocksProxyPort=8080"
cd kantan_resource/kantanPro
mvn package spring-boot:repackage
#mvn package spring-boot:repackage -Dhttp.proxyHost=exaproxy.exa-corp.co.jp -Dhttp.proxyPort=8080