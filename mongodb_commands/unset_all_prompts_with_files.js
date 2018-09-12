db.getCollection('prompts').updateMany({}, {
    $unset: {
        files: ""
    }
})