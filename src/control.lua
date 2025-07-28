local events = require("script.functions")

script.on_load(events.on_init)
script.on_init(events.on_init)
script.on_configuration_changed(events.on_init)
