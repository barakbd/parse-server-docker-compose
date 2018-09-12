db.getCollection('acquisitions').updateMany({}, {
    $unset: {
        acq_folder_id: "",
        acq_folder_metadata: "",
        ws_folders: "",
        cdt_folders: ""
    }
})