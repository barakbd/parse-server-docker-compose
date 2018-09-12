db.getCollection('users_copy').find({
    roles: {$in:["ROLE_ACQUIRED"]},
    acqId: {
        $exists: true,
        $eq: ObjectId("5914be3f2c9514476f1ddf24")
        }
    })