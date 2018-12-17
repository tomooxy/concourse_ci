#!/bin/bash
touch key
echo "${LOCAL_MACHINE_PRIVATE_KEY}" > key
chmod 0600 key
scp -oStrictHostKeyChecking=no -i key kantan_module_resource/modules/kantanPro-0.0.1-SNAPSHOT.jar vagrant@192.168.33.10:/home/vagrant/concourse/module/

ssh -oStrictHostKeyChecking=no -i key vagrant@192.168.33.10 <<EOC
cd /home/vagrant/concourse/module/
cf login -a api.run.pivotal.io -u tomoyuki-ito@exa-corp.co.jp -p P@ssw0rd
cf push kantanPro -p kantanPro-0.0.1-SNAPSHOT.jar -b https://github.com/cloudfoundry/java-buildpack.git
EOC
