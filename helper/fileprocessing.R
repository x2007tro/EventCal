##
# Process file

file_process <- function(path){
  files <- list.files(path=path, pattern="*.xlsx", full.names=TRUE, recursive=FALSE)
  files_info <- file.info(files)
  mr_file <- rownames(files_info)[which(files_info$mtime == max(files_info$mtime))]
  
  sss <- as.data.frame(readxl::read_excel(mr_file, sheet = "Schedule"))
  
  ##
  # load data into list
  res <- lapply(1:nrow(sss), function(i){
    if(sss[i, "Active"] == 1){
      res2 <- list(
        date = sss[i, "Date"],
        timeslot = sss[i, "Timeslot"],
        status = sss[i, "Status"],
        bc = sss[i, "BillingCycle"]
      )
    } else {
      res2 <- NULL
    } 
    return(res2)
  })
  res <- res[which(!sapply(res, is.null))]
  names(res) <- sss[sss$Active == 1, "Date"]
  
  return(res) 
}