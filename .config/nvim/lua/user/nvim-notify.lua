local notify = require("notify")
notify.setup( {
  stages = 'fade_in_slide_out',
  on_open = nil,
  on_close = nil,
  render = 'default',
  minimum_width = 50,
  background_colour = 'Normal',
  timeout = 5000,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

