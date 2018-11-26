###### ログイン 
`fly -t lite login -c http://192.168.100.4:8080`
###### パイプライン登録
`fly -t lite set-pipeline -p kantanPro -c kantan_pipeline.yml`
###### パイプラインunpause
`fly -t lite unpause-pipeline -p kantanPro`
###### リンク
`http://192.168.100.4:8080/teams/main/pipelines/kantanPro`
###### pipeline削除
`fly -t concourseci ps`
`fly -t concourseci dp -p パイプライン名`