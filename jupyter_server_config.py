c.ServerProxy.servers = {
    "wordfinder": {
        "command": ["R", "-e", 
                    "shiny::runApp('/home/jovyan/tools/wordfinder', port={port}, host='0.0.0.0')"],
        "port": 3838,
        "timeout": 120,
        "launcher_entry": {
            "enabled": False
        },
        "managed": True
    }
}
