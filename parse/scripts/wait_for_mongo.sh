#!/bin/sh
# wait-for-postgres.sh
echo "-------- Testing Mongo Connection before exec cmd -------------------"
set -e

# host="$1"
# shift
# cmd="$@"

# until mongo --username $MONGO_INITDB_DATABASE_OWNER --password $MONGO_INITDB_DATABASE_OWNER_PASSWORD --authenticationDatabase admin --host $host --port 27017 --eval 'quit()'; do
until node /parse-server/scripts/wait_for_mongo.js; do
  >&2 echo "Mongo is unavailable - exit code ${$?} - sleeping"
  sleep 1
done

# >&2 echo "Mongo is up - exit code ${$?} - executing command"
>&2 echo "Mongo is up - exit code - executing command"
# exec $cmd