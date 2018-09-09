##
# handle calendar view
##
output$cal_view <- renderUI({
  ##
  # Decide which slot to use
  first_day <- lubridate::make_date(input$cal_year, month_dict[[input$cal_month]], 1)
  first_day_weekday <- weekdays(first_day)
  num_of_days <- unname(lubridate::days_in_month(first_day))
  beg_loc <- weekday_dict[[first_day_weekday]]
  end_loc <- beg_loc + num_of_days - 1
  vld_ids <- beg_loc:end_loc
  
  ##
  # Build a 6 x 7 calendar view
  lapply(1:6, function(i){
    fluidRow(
      column(
        width = 12,
        lapply(1:7, function(j){
          
          curr_id <- (i-1)*7 + j
          curr_date <- first_day + curr_id - beg_loc
          if(is.null(input$file_u)) eve <- sche_fb[[paste0(curr_date)]] else eve <- sche()[[paste0(curr_date)]]
          
          tags$div(
            id = paste0("day_float2_id", curr_id),
            class = "day_floater2",
            
            if(curr_id %in% vld_ids){
              shypka.ddiv(
                tags$div(
                  class = "day_styler",
                  id = paste0("div_day_", curr_id),
                  tags$h4(class = "block_wkdy", paste0("", curr_id - beg_loc + 1)),
                  
                  if(is.null(eve)){

                    ##
                    # Adjust color
                    bc_clr <- "rgba(255,222,173,1)"  #navajowhite
                    status_clr <- "gray"
                    
                    ##
                    # Render image
                    tagList(
                      tags$div(
                        style = paste0("border-radius:3px; background-color:", bc_clr),
                        tags$div(class = "day_spacer"),
                        
                        ##
                        # time
                        tags$div(
                          shypka.ddiv(
                            tags$h5(
                              class = "block_event1",
                              "time"
                            )
                          ),
                          shypka.ddiv(
                            tags$h4(
                              class = "block_event2",
                              "none"
                            )
                          )
                        ),
                        
                        ##
                        # time
                        tags$div(
                          shypka.ddiv(
                            tags$h5(
                              class = "block_event1",
                              "status"
                            )
                          ),
                          shypka.ddiv(
                            tags$h4(
                              class = "block_event2",
                              "none"
                            )
                            #color = status_clr
                          )
                        ),
                        
                        tags$div(class = "day_spacer") 
                      )
                    )
                    
                  } else {
                    
                    ##
                    # Adjust color
                    bc_clr <- bc_colors[[paste0("n", eve$bc)]]
                    status_clr <- status_colors[[eve$status]]
                    
                    ##
                    # Render image
                    tagList(
                      tags$div(
                        style = paste0("border-radius:3px; background-color:", bc_clr),
                        tags$div(class = "day_spacer"),
                        
                        ##
                        # time
                        tags$div(
                          shypka.ddiv(
                            tags$h5(
                              class = "block_event1",
                              "time"
                            )
                          ),
                          shypka.ddiv(
                            tags$h4(
                              class = "block_event2",
                              eve$timeslot
                            )
                          )
                        ),
                        
                        ##
                        # time
                        tags$div(
                          shypka.ddiv(
                            tags$h5(
                              class = "block_event1",
                              "status"
                            )
                          ),
                          shypka.ddiv(
                            tags$h4(
                              class = "block_event2",
                              eve$status
                            ),
                            color = status_clr
                          )
                        ),
                        
                        tags$div(class = "day_spacer") 
                      )
                    ) 
                  }
                ),
                color = "rgba(220, 220, 220, 1)"
              )
            } else {
              shypka.ddiv(
                tags$div(
                  style = "color:white;",
                  class = "day_styler",
                  "empty"
                )
              )
            } 
          
          )
        }) 
      )
    )
  })
})