#' Get list of the events scheduled for today (or any day).
#'
#'
#' @param token token obtained from [calendar_token()]
#'
#' @return Tibble with columns for .
#' @family calendar functions
#'
#' @export

gcaltoday <- function(today = Sys.Date(), id = gargle::gargle_oauth_email()) {

today <- calendar_events(id = id ,now = today, days_in_future = 1,days_in_past = 0)

events <- today %>%
  mutate(start_time = format(start_datetime-(5*60*60), "%H:%M"),
         end_time = format(end_datetime-(5*60*60), "%H:%M") )  %>%
  select(start_time, end_time, summary, description) %>%
  arrange(start_time) %>%
  mutate(start_time = as.numeric(str_replace(start_time, ':', ''))+100) %>%
  mutate(end_time = as.numeric(str_replace(end_time, ':', ''))+ 100) %>%
  select (start_time, end_time, summary)
return(events)
}

