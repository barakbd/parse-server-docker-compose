db.getCollection('prompts').find({
    files: {
        $exists: true
    }
})