"# concourse_ci" 
fly -t lite login -c http://192.168.100.4:8080
fly -t lite set-pipeline -p kantanPro -c kantan_pipeline.yml

http://192.168.100.4:8080/teams/main/pipelines/kantanPro

