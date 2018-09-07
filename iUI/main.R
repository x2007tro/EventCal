##
# Source all ui files
##
ui_files <- c("fitness")
lapply(ui_files, function(f){
  source(paste0("./iUI/", f, ".R"), local = FALSE)
})

##
# Shiny ui
##
mainUI <- fluidPage(theme = shinythemes::shinytheme("simplex"),
  
  # css style
  tags$head(
    includeCSS("stt_style.css")
  ),
  
  navbarPage(
    "Event Calendar",
    
    ##
    # Calendar panel
    ##
    tabPanel(
      "Calendar",
      
      ##
      # Display calendars
      navlistPanel(
        "Event list",
        widths = c(2, 10),
        
        tabPanel(
          "Fitness",
          tabsetPanel(
            tp_fitness
          )
        ),
        
        tabPanel(
          "Study"
        )
      )
      
    ),
    
    ##
    # Development panel
    ##
    tabPanel(
      "Development"
    )
    
  )
  # End of navbarpage
)
