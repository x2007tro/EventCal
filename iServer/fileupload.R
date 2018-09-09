##
# This handles schedule upload
sche <- reactive({
  
  req(input$file_u)
  fu <- as.data.frame(readxl::read_excel(input$file_u$datapath, sheet = "Schedule"))
  openxlsx::write.xlsx(fu, paste0(sche_path, "fitness_schedule_", format(Sys.time(), "%Y%m%d%H%M%S"), ".xlsx"), 
                       sheetName = "Schedule", col.names = TRUE, row.names = FALSE)
  
  res <- file_process(sche_path)
  return(res)
})

##
# This handles template download
output$file_d <- downloadHandler(
  
  # This function returns a string which tells the client
  # browser what name to use when saving the file.
  filename = function() {
    paste0("fitness_schedule_", "template", ".xlsx")
  },
  
  content = function(file) {
    tmp <- data.frame(
      Date = Sys.Date(),
      Timeslot = "7PM-8PM",
      Status = "booked",
      BillingCycle = 1,
      Active = 0,
      EntryDate = Sys.Date(),
      Comments = "Billing cycle controls month tab color (1 = light green, 0 = light blue) | 
      Active controls if the record will appear on the calendar (1 = yes, 0 = no) | 
      EntryDate and Comments will NOT appear on the calendar, information items only",
      stringsAsFactors = FALSE
    )
    #write.csv(tmp, file, row.names = FALSE)
    openxlsx::write.xlsx(tmp, file, sheetName = "Schedule", col.names = TRUE, row.names = FALSE)
  }
)