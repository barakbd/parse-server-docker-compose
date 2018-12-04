#!/usr/bin/env bash

# --------- create inital db and db owner ------------
# https://medium.com/@MaxouMask/secured-mongodb-container-6b602ef67885
# https://stackoverflow.com/questions/10743905/how-can-i-use-a-script-to-create-users-in-mongodb
# https://hub.docker.com/_/mongo/
# https://stackoverflow.com/questions/39444467/how-to-pass-environment-variable-to-mongo-script
# ls -l /scripts
echo ' ------ Creating parse database owner and  collection -------'

mongo -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin admin <<EOF
use admin
db.createUser({
  user:  '$MONGO_INITDB_DATABASE_OWNER',
  pwd: '$MONGO_INITDB_DATABASE_OWNER_PASSWORD',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_INITDB_DATABASE'
  }]
})
use $MONGO_INITDB_DATABASE
db.createCollection('$MONGO_INITDB_DATABASE_COLLECTION')
EOF
echo -e "----------- mogno setup completed -------------------\n"
# This also works - need to map the scripts folder 
# mongo -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --authenticationDatabase admin admin --eval "
# var MONGO_INITDB_DATABASE='$MONGO_INITDB_DATABASE'
# var MONGO_INITDB_DATABASE_OWNER='$MONGO_INITDB_DATABASE_OWNER'
# var MONGO_INITDB_DATABASE_OWNER_PASSWORD='$MONGO_INITDB_DATABASE_OWNER_PASSWORD'
# var MONGO_INITDB_DATABASE_COLLECTION='$MONGO_INITDB_DATABASE_COLLECTION'
# " /scripts/create_user_and_db.js
