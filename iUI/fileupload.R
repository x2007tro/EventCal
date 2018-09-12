##
# File upload page
##
tp_fileupload <- tabPanel(
  "Admin",
  
  fluidRow(
   column(
     width = 12,
     
     shypka.ddiv(tags$h3(class = "block_title", "Upload and Download"), color = "rgba(105,105,105,1)"),
     tags$br(),
     downloadButton(class = "btn-primary", "file_d", "Download Current Schedule"),
     tags$br(), tags$br(),
     fileInput("file_u", "Upload Schedule",
               multiple = FALSE,
               accept = c(".xlsx", ".xls"))
   ) 
  )
  
)