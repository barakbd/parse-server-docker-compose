#!/usr/bin/env bash
# https://medium.com/@MaxouMask/secured-mongodb-container-6b602ef67885
# https://stackoverflow.com/questions/10743905/how-can-i-use-a-script-to-create-users-in-mongodb
# https://hub.docker.com/_/mongo/

# echo ' ------ updating mongorc.js with new prompt -------'
# https://stackoverflow.com/questions/21414608/mongodb-show-current-user
# echo 'prompt = function() {
#     user = db.runCommand({connectionStatus : 1}).authInfo.authenticatedUsers[0]
#     if (user) {
#         return "user: " + user.user + ">"
#     }
#     return ">"
# }' >> ~/.mongorc.js       

echo ' ------ Creating parse database owner and  collection -------'
mongo -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin admin --eval "
var MONGO_INITDB_DATABASE='$MONGO_INITDB_DATABASE'
var MONGO_INITDB_DATABASE_OWNER='$MONGO_INITDB_DATABASE_OWNER'
var MONGO_INITDB_DATABASE_OWNER_PASSWORD='$MONGO_INITDB_DATABASE_OWNER_PASSWORD'
var MONGO_INITDB_DATABASE_COLLECTION='$MONGO_INITDB_DATABASE_COLLECTION'
" 2-initdb.js

# mongo -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin admin <<EOF
# use admin
# db.createUser({
#   user:  '$MONGO_INITDB_ROOT_USERNAME',
#   pwd: '$MONGO_INITDB_ROOT_PASSWORD',
#   roles: [{
#     role: 'readWrite',
#     db: '$MONGO_INITDB_DATABASE'
#   }]
# })
# use '$MONGO_INITDB_DATABASE'
# db.createCollection('$MONGO_INITDB_DATABASE_COLLECTION')
# EOF