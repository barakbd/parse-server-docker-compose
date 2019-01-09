console.log("wait_for_mongo.js")
const MongoClient = require("mongodb").MongoClient;

// Connection URL
const url = process.env.PARSE_SERVER_DATABASE_URI;

// Use connect method to connect to the server
// MongoClient.connect(url, { useNewUrlParser: true }, function(err, client) {
//   assert.equal(null, err);
//   console.log("Connected successfully to server");
//   process.exit(0)
// }).then(success=>{}).catch()

MongoClient.connect(
  url,
  { useNewUrlParser: true }
)
  .then(success => {
    console.log("Connected successfully to server\n", success);
    process.exit(0);
  })
  .catch(error=>{
    console.log("Error connecting to server\n", error);
    process.exit(1)
  });
