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
      shypka.ddiv(tags$h3(class = "block_title", "Select"), color = "rgba(105,105,105,1)"),  # dimgray
      
      fluidRow(
        column(
          width = 6,
          tags$b(selectInput("cal_year", label = "Year", choices = all_years, 
                      selected = lubridate::year(Sys.Date()), multiple = FALSE))
        ),
        column(
          width = 6,
          tags$b(selectInput("cal_month", label = "Month", choices = names(month_dict), 
                      selected = months(Sys.Date()), multiple = FALSE))
        )
      ),
      
      shypka.ddiv(tags$h3(class = "block_title", "Calendar"), color = "rgba(105,105,105,1)"),  # dimgray
      shypka.ddiv(
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
                  shypka.ddiv(
                    tags$h4(
                      class = "block_wkdy",
                      names(weekday_dict)[j]
                    ),
                    color = "rgba(220, 220, 220, 1)"
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