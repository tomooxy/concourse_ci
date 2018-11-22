#!/bin/bash
cd kantan_resource/kantanPro
mvn package spring-boot:repackage -Dhttp.proxyHost=exaproxy.exa-corp.co.jp -Dhttp.proxyPort=8080