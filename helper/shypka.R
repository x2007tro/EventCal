##
# Shiny helper function
##
require(shiny)
shypka.ddiv1 <- function(
  ui_element, 
  frame_cln = "block_outter_frame1", 
  content_cln = "block_inner_frame1"){
  
  res <- tags$div(class = frame_cln, tags$div(class = content_cln,
      ui_element
  ))
  
  return(res)
}

shypka.ddiv2 <- function(
  ui_element, 
  frame_cln = "block_outter_frame2", 
  content_cln = "block_inner_frame2"){
  
  res <- tags$div(class = frame_cln, tags$div(class = content_cln,
                                              ui_element
  ))
  
  return(res)
}

