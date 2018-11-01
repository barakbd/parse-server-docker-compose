// var db is automatically set from env var MONGO_INITDB_DATABASE - https://hub.docker.com/_/mongo/
db.createUser(
    {
        user: MONGO_INITDB_DATABASE_OWNER,
        pwd: MONGO_INITDB_DATABASE_OWNER_PASSWORD,
        roles: [{ role: "dbOwner", db: "parse" }]
    }
)
db.createCollection(MONGO_INITDB_DATABASE_COLLECTION)
