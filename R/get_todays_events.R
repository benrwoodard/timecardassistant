#' Get list of the events scheduled for today (or any day).
#'
#'
#' @param token token obtained from [calendar_token()]
#' @param id Email authorization
#' @param today What date is being used to pull the data
#'
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
  mutate(start_time = ifelse(nchar(start_time)<4,
                             format(strptime(paste0(0, start_time), format = '%H%M'),'%r'),
                             format(strptime(start_time, format = '%H%M'), '%r')),
         end_time = ifelse(nchar(end_time)<4,
                           format(strptime(paste0(0, end_time), format = '%H%M'), '%r'),
                           format(strptime(end_time, format = '%H%M'), '%r')))%>%
  select (start_time, end_time, summary)
return(events)
}

