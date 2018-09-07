##
# Fitness panel
##
tp_fitness <- tabPanel(
  "Monthly Calendar",
  
  fluidRow(
    
    ##
    # Calendar
    ##
    column(
      width = 12,
      shypka.ddiv2(tags$h3(class = "block_title", "Select")),
      
      fluidRow(
        column(
          width = 6,
          selectInput("cal_year", label = "Year", choices = all_years, 
                      selected = lubridate::year(Sys.Date()), multiple = FALSE)
        ),
        column(
          width = 6,
          selectInput("cal_month", label = "Month", choices = names(month_dict), 
                      selected = months(Sys.Date()), multiple = FALSE)   
        )
      ),
      
      shypka.ddiv2(tags$h3(class = "block_title", "Calendar")),
      shypka.ddiv1(
        tags$div(
          id = "cal_container",
          
          ##
          # Build a 1 x 7 weekday title
          fluidRow(
            column(
              width = 12,
              lapply(1:7, function(j){
                tags$div(
                  class = "day_floater1",
                  shypka.ddiv2(
                    tags$h4(
                      class = "block_wkdy",
                      names(weekday_dict)[j]
                    )
                  )
                )
              })
            )
          ),
          
          uiOutput("cal_view")
        )
      )
    )
    
    # ##
    # # Admin
    # column(
    #   width = 0,
    #   shypka.ddiv2(tags$h3(class = "block_title", "Admin"))
    # )
  )
  
)