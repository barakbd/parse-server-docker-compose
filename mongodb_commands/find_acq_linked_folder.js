db.getCollection('acquisitions').find({
    acq_folder_id: {
        $ne: null
    }
})