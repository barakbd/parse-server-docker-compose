db.getCollection('users').remove({username: {$nin: [
    "chardman",
    "cdtbava.gen",
    "arebach@broadsoft.com",
    "zhimsun",
    "shlomoate@gmail.com",
    "cstg-cdt.gen@cisco.com",
    "jrunion",
    "bbendavi",
    "alexmil"
    ]}    
})