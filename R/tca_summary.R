#' Summarize your timecard by date and client
#'
#' This summarizes the results of you hard work by day.
#'
#' @description Summarizes the group by day
#'
#' @param timecard ads the timecard dataframe to the function
#'
#' @import dplyr
#'
#' @export

tca_summary <- function(timecard = timecard, date_filter = Sys.Date()) {

  summary <- timecard %>%
    filter(date == date_filter) %>%
    mutate(client = tolower(client)) %>%
    group_by(date, client) %>%
    summarise(rawtime = sum(dif), psatime = sum(psatime))

  summary

}

