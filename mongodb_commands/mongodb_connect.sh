#Connect to dev db:
mongo mngdb-cbt-stg-01:27058,mngdb-cbt-stg-02:27058,mngdb-cbt-stg-03:27058/cdt_dev?replicaSet=cbt-stg-rep --authenticationDatabase cdt_dev -u cdtdev
p -p ‘cdTd3v’  --quiet
