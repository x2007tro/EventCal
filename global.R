##
# Global parameter
##
entry_wid_s <- "80px"
entry_wid_m <- "120px"
entry_wid_l <- "250px"

all_years <- 2018:2028

month_dict <- list(
  January = 1, 
  February = 2, 
  March = 3, 
  April = 4, 
  May =5, 
  June = 6,
  July = 7, 
  August = 8, 
  September = 9, 
  October = 10, 
  November = 11, 
  December = 12)

weekday_dict <- list(
  Sunday = 1,
  Monday = 2,
  Tuesday = 3,
  Wednesday = 4,
  Thursday = 5,
  Friday = 6,
  Saturday = 7
)

status_colors <- list(
  completed = "rgba(0,100,0,1)",  # darkgreen
  missed = "rgba(220,20,60,1)",   # crimson
  booked = "rgba(255,99,71,1)",   # tomato
  unbooked = "rgba(0,139,139,1)"  # darkcyan
)

bc_colors <- list(
  n1 = "rgba(173,255,47,1)",      # greenyellow
  n0 = "rgba(176,224,230,1)"      # power blue
)

sche_path <- "./input/"
sche_fb <- file_process(path = sche_path)