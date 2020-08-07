#' Summarize your timecard by date and client
#'
#' This summarizes the results of you hard work by day.
#'
#' @description Summarizes the group by day
#'
#' @param timecard adds the timecard dataframe to the function
#' @param date_filter This helps filter the results to today's date or change it.
#'
#' @import dplyr
#'
#' @export

tca_summary <- function(timecard = timecard, date_filter = Sys.Date()) {

  timecard %>%
    filter(date == date_filter) %>%
    mutate(client = tolower(client)) %>%
    group_by(client) %>%
    summarise(psatime = sum(psatime)) %>%
    ungroup() %>%
    add_row(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))



}

