###### ログイン 
`fly -t lite login -c http://192.168.100.4:8080`
###### パイプライン登録
`fly -t lite set-pipeline -p concourse-sample -c kantan_pipeline.yml -l ../credentials.yml`
###### パイプラインunpause
`fly -t lite unpause-pipeline -p concourse-sample`
###### リンク
`http://192.168.100.4:8080/teams/main/pipelines/concourse-sample`
###### pipeline削除
`fly -t lite ps`  
` fly -t lite dp -pパイプライン名`