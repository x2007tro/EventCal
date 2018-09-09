##
# Source all ui files
##
ui_files <- c("fitness", "fileupload")
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
            tp_fitness,
            tp_fileupload
          )
        )
        
        # tabPanel(
        #   "Study"
        # )
      )
      
    ),
    
    ##
    # Development panel
    ##
    tabPanel(
      "Development",
      tags$b(tags$h5("No ongoing development in process!"))
    )
    
  )
  # End of navbarpage
)
