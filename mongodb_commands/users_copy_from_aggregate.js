db.users_prod.aggregate([
  {$match: 
      {$or:[
       {roles: ["ROLE_ADMIN"]},
       {roles: ["ROLE_DEFAULT_NO_PERMISSIONS"]},
       {roles: ["ROLE_SITE_PM"]},
       {roles: ["ROLE_ACQUIRED"]},
       {roles: []}
      ]}
  }
  ,{$group: 
      {
//           _id: {roles: "$roles", acqId: "$acqId"}, 
         _id: {roles: "$roles", acqId: {$gt: ["$acqId", null]}},
         data: {$push: "$$ROOT"}
      }
  }
  ,{$project: 
      {
          data: {$slice: ["$data", 1]},
          originalDataSize: {$size: "$data"}
          
      }
  }
  ,{$unwind: 
      "$data"
  }
  ,{$replaceRoot: 
      {newRoot: "$data"}
  }
 ,{$out:
      "users"
  }
])
