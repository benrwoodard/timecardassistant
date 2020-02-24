#' End the day and get a csv file
#'
#' When your day is done and you want to keep a copy of the day's
#' times for a record. Call this function and it will produce a CSV
#' file on your home directory.  It will include the date in the filename.
#'
#' @description Use this as often as you like to make sure the global
#' variables are not erased during your day. The file should be overwritten
#' the next time you used the function on the same day.
#' @export


endday <- function() {
  if(exists('timecard')) {
    write.csv(timecard, paste0(Sys.Date(),'_timecard.csv'))
  } else {
    print('Error: Something went wrong unfortunately. Unnable top find a global variable named \"timecard\".')
  }
}
