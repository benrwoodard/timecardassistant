#' Summarize the timecard by date and client
#'
#' Summarizes the results of your hard work by day for the current week
#'
#' @param pn boolean FALSE (default) or TRUE to include the dimension in the summary table
#' @param description boolean FALSE (default) or TRUE to include the dimension in the summary table
#' @param timecardobject adds the timecard dataframe to the function
#' @param flag_date For current week leave as default. A different date can be added if needed.
#'
#' @return The summary table showing the current week by default but the argument 'flag_date' can
#' be utilized to show any other date that has been recorded in the timecard object.
#'
#'
#' @importFrom lubridate floor_date
#' @importFrom magrittr %>%
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom dplyr arrange
#' @importFrom tidyr spread
#' @importFrom dplyr arrange
#' @importFrom tidyr replace_na
#' @importFrom tidyr everything
#' @importFrom dplyr across
#' @importFrom janitor adorn_totals
#'
#' @export
#'
summarytc <- function(pn = F,
                      description = F,
                      timecardobject = timecard,
                      flag_date = Sys.Date()) {

  date_filter_tc = lubridate::floor_date(as.Date(flag_date, "%m/%d/%Y"), unit="week")

  if(timecardobject %>%
      dplyr::mutate(date2 = as.Date(date)) %>%
      dplyr::filter(date2 >= date_filter_tc) %>%
      summarise(sum(psatime)) == 0) {
    stop('You don\'t have any hours for the week yet.')
  }
 if(pn == FALSE & description == FALSE){
  timecardobject %>%
    dplyr::mutate(date2 = as.Date(date)) %>%
    dplyr::filter(date2 >= date_filter_tc) %>%
    dplyr::mutate(client = tolower(client)) %>%
    dplyr::group_by(date2, client) %>%
    dplyr::summarise( psatime = sum(psatime), .groups = 'drop') %>%
    dplyr::arrange(client) %>%
    tidyr::spread(date2, psatime) %>%
    janitor::adorn_totals("row") %>%
    dplyr::mutate(dplyr::across(where(is.numeric), ~tidyr::replace_na(.x, 0)))
 } else if(pn == TRUE & description == FALSE) {
   timecardobject %>%
     dplyr::mutate(date2 = as.Date(date)) %>%
     dplyr::filter(date2 >= date_filter_tc) %>%
     dplyr::mutate(client = tolower(client)) %>%
     dplyr::group_by(date2, client, projectname) %>%
     dplyr::summarise( psatime = sum(psatime), .groups = 'drop') %>%
     dplyr::arrange(client) %>%
     tidyr::spread(date2, psatime) %>%
     janitor::adorn_totals("row") %>%
     dplyr::mutate(dplyr::across(where(is.numeric), ~tidyr::replace_na(.x, 0)))
 } else if(pn == FALSE & description == TRUE) {
   timecardobject %>%
     dplyr::mutate(date2 = as.Date(date)) %>%
     dplyr::filter(date2 >= date_filter_tc) %>%
     dplyr::mutate(client = tolower(client)) %>%
     dplyr::group_by(date2, client, description) %>%
     dplyr::summarise( psatime = sum(psatime), .groups = 'drop') %>%
     dplyr::arrange(client) %>%
     tidyr::spread(date2, psatime) %>%
     janitor::adorn_totals("row") %>%
     dplyr::mutate(dplyr::across(where(is.numeric), ~tidyr::replace_na(.x, 0)))
 } else if(pn == TRUE & description == TRUE) {
   timecardobject %>%
     dplyr::mutate(date2 = as.Date(date)) %>%
     dplyr::filter(date2 >= date_filter_tc) %>%
     dplyr::mutate(client = tolower(client)) %>%
     dplyr::group_by(date2, client, projectname, description) %>%
     dplyr::summarise( psatime = sum(psatime), .groups = 'drop') %>%
     dplyr::arrange(client) %>%
     tidyr::spread(date2, psatime) %>%
     janitor::adorn_totals("row") %>%
     dplyr::mutate(dplyr::across(where(is.numeric), ~tidyr::replace_na(.x, 0)))
  }
}
