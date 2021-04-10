#' Summarize the timecard by date and client
#'
#' Summarizes the results of your hard work by day for the current week
#'
#' @param timecard adds the timecard dataframe to the function
#' @param date For current week leave as default. A different date can be added if needed.
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
#' @importFrom tibble add_row
#' @importFrom dplyr summarise_all
#' @importFrom dplyr funs
#'
#' @export

summary <- function(timecard = timecard,
                    date = Sys.Date()) {

  date_filter = lubridate::floor_date(as.Date(date, "%m/%d/%Y"), unit="week")

  timecard %>%
    dplyr::filter(date >= date_filter) %>%
    dplyr::mutate(client = tolower(client)) %>%
    dplyr::group_by(date, client) %>%
    dplyr::summarise( psatime = sum(psatime)) %>%
    dplyr::arrange(client) %>%
    tidyr::spread(date, psatime)%>%
    tibble::add_row(dplyr::summarise_all(., dplyr::funs(if(is.numeric(.)) sum(., na.rm = T) else "Total")))

}
