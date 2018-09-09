##
# Source server and ui components
##
require(shiny)
source("helper/shypka.R")
source("helper/fileprocessing.R")
source("global.R", local = FALSE)
source("iUI/main.R")
source("iServer/main.R")

##
# Launch shiny app
##
shinyApp(
  ui = mainUI,
  server = mainServer
)