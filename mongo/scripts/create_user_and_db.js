// var db is automatically set from env var MONGO_INITDB_DATABASE - https://hub.docker.com/_/mongo/
printjson("using db - " + db); 
db.createUser(
    {
        user: MONGO_INITDB_DATABASE_OWNER,
        pwd: MONGO_INITDB_DATABASE_OWNER_PASSWORD,
        roles: [{ role: "dbOwner", db: MONGO_INITDB_DATABASE}]
    }
)
db = db.getSiblingDB(MONGO_INITDB_DATABASE)
printjson("using db - " + db); 
db.createCollection(MONGO_INITDB_DATABASE_COLLECTION)