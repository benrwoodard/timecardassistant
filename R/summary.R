#' Summarize the timecard by date and client
#'
#' Summarizes the results of your hard work by day for the current week
#'
#' @param timecard adds the timecard dataframe to the function
#' @param flag_date For current week leave as default. A different date can be added if needed.
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
#' @importFrom janitor adorn_totals
#' @export

summary <- function(timecard = timecard,
                    flag_date = Sys.Date()) {

  date_filter = lubridate::floor_date(as.Date(flag_date, "%m/%d/%Y"), unit="week")

  timecard %>%
    dplyr::filter(date >= date_filter) %>%
    dplyr::mutate(client = tolower(client)) %>%
    dplyr::group_by(date, client) %>%
    dplyr::summarise( psatime = sum(psatime), .groups = 'drop') %>%
    dplyr::arrange(client) %>%
    tidyr::spread(date, psatime) %>%
    janitor::adorn_totals("row")
}
