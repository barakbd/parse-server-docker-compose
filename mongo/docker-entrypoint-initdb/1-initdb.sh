#!/usr/bin/env bash
# https://medium.com/@MaxouMask/secured-mongodb-container-6b602ef67885
# https://stackoverflow.com/questions/10743905/how-can-i-use-a-script-to-create-users-in-mongodb
# https://hub.docker.com/_/mongo/

echo ' ------ Creating parse database and owner -------'

# # mongo ${MONGO_INITDB_DATABASE} \
# #         --host ${MONGO_HOST} \
# #         --port ${MONGO_PORT} \
# #         -u ${MONGO_INITDB_ROOT_USERNAME} \
# #         -p ${MONGO_INITDB_ROOT_PASSWORD} \
# #         --authenticationDatabase admin \
# #         --eval "db.createUser({user: '${MONGO_INITDB_DATABASE_OWNER}', pwd: '${MONGO_INITDB_DATABASE_OWNER_PASSWORD}', roles:[{role:'dbOwner', db: '${MONGO_INITDB_DATABASE_OWNER}'}]});"

mongo --eval \
"var MONGO_INITDB_DATABASE_OWNER=$MONGO_INITDB_DATABASE_OWNER, MONGO_INITDB_DATABASE_OWNER_PASSWORD=$MONGO_INITDB_DATABASE_OWNER_PASSWORD \
MONGO_INITDB_DATABASE_COLLECTION=$MONGO_INITDB_DATABASE_COLLECTION" \ 
2-initdb.js