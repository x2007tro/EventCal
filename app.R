##
# Source server and ui components
##
require(shiny)
source("global.R", local = FALSE)
source("iUI/main.R")
source("iServer/main.R")
source("helper/shypka.R")

##
# Launch shiny app
##
shinyApp(
  ui = mainUI,
  server = mainServer
)