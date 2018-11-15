// ------- Show current user in mongo shell prompt ------------
// https://stackoverflow.com/questions/21414608/mongodb-show-current-user
// HOW TO USE - cat /scripts/mongorc.js > ~/.mongorc.js

prompt = function() {
    user = db.runCommand({connectionStatus : 1}).authInfo.authenticatedUsers[0]
    if (user) {
        return "user: " + user.user + "> "
    }
    return "user: NONE> "
}
