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
          tags$div(
            id = paste0("day_float2_id", curr_id),
            class = "day_floater2",
            
            if(curr_id %in% vld_ids){
              shypka.ddiv2(
                tags$div(
                  class = "day_styler",
                  id = paste0("div_day_", curr_id),
                  tags$h4(class = "block_wkdy", paste0("Day ", curr_id - beg_loc + 1)),
                  textInput(paste0("timeslot_day_", curr_id), label = "Time", value = "19:00-20:00", width = "95%"),
                  textInput(paste0("status_day_", curr_id), label = "Status", value = "Done", width = "95%"),
                  actionButton(class = "btn-primary", paste0("update_day_", curr_id), label = "Update"),
                  tags$div(class = "day_spacer")
                )
              )
            } else {
              shypka.ddiv1(
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