db.getCollection('users_copy').find({
      $or: [
        {
          roles: {
            $ne: [],
            $nin: ["ROLE_DEFAULT_NO_PERMISSIONS", "ROLE_ACQUIRED"]
          }
        },
        {
          $and: [
            { roles: { $in: ["ROLE_ACQUIRED"] } },
            {
              acqId: {
                $exists: true,
                $eq: ObjectId("5914be3f2c9514476f1ddf24")
              }
            }
          ]
        }
      ]
    })