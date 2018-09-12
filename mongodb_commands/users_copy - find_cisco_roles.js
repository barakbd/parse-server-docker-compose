db.getCollection('users_copy').find({
    $or: [
        {roles: {$ne: []}},
        {roles: {$nin: ["ROLE_DEFAULT_NO_PERMISSIONS", "ROLE_ACQUIRED"]}}
    ]
})