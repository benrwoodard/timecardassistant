#' Add time to your timecard
#'
#' This is used to add time to the timecard file and updates the timecard csv for the day.
#'
#'
#' @param client Client initials ex. 1pw, gsk, ccc
#' @param pn Project Name
#' @param started The time that the work block started. Must be a character string. ex. '08:00'
#' @param finished The time that the work block is finished. Must be a character string. ex. '14:30'
#' @param notes Add notes for each project if needed
#' @param date The date the event took place. Defaults to the current date.
#' @param existing_timecard The timecard object that will be used to record the new project activity. Does not need to exist
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr select
#' @importFrom dplyr mutate
#'
#' @export
#'

addtimetc <- function(client = "sdi",
                      pn = "admin",
                      started = NULL ,
                      finished = NULL,
                      notes = '',
                      date = Sys.Date(),
                      existing_timecard = timecard) {
  if(is.null(started) | is.null(finished)) {
    stop('You must provide both the started and finished values')
  }
  started = '17:00'
  finished = '17:23'
  projectname <- pn
  started <- as.POSIXct(started, format="%H:%M")

  finished <- as.POSIXct(finished, format="%H:%M")
  date <- as.character(Sys.Date())
  dif <- round(as.numeric(finished - started)/60, 2)
  ps2 <- data.frame(client, date, projectname, started = format(started, '%H:%M'), finished = format(finished, '%H:%M'), dif, notes)

  addtime <- ps2 %>% dplyr::mutate(psatime =  ifelse(dif > .24 & dif < .75, .5,
                                               ifelse(dif >= .75 & dif < 1.25, 1.0,
                                                      ifelse(dif >= 1.25 & dif < 1.75, 1.5,
                                                             ifelse(dif >= 1.75 & dif < 2.25, 2.0,
                                                                    ifelse(dif >= 2.25 & dif < 2.75, 2.5,
                                                                           ifelse(dif >= 2.75 & dif < 3.25, 3.0,
                                                                                  ifelse(dif >= 3.25 & dif < 3.75, 3.5,
                                                                                         ifelse(dif >= 3.75 & dif < 4.25, 4.0,
                                                                                                ifelse(dif >= 4.25 & dif < 4.75, 4.5,
                                                                                                       ifelse(dif >= 4.75 & dif < 5.25, 5.0,
                                                                                                              ifelse(dif >= 5.25 & dif < 5.75, 5.5,
                                                                                                                     ifelse(dif >= 5.75 & dif < 6.25, 6.0,
                                                                                                                            ifelse(dif >= 6.25 & dif < 6.75, 6.5,
                                                                                                                                   ifelse(dif >= 6.75 & dif < 7.25, 7.0,
                                                                                                                                          ifelse(dif >= 7.25 & dif < 7.75, 7.5,
                                                                                                                                                 ifelse(dif >= 7.75 & dif < 8.25, 8.0, dif)))))))))))))))))
  addtime <- addtime %>% dplyr::select("client", "date", "projectname", "started", "finished", "dif", "psatime", "notes")

  if(exists('timecard')) {
    timecard <-  rbind(existing_timecard, addtime)
    pos <- 1
    envir = as.environment(pos)
    assign('timecard', timecard, envir = envir)
  } else {
    pos <- 1
    envir = as.environment(pos)
    assign("timecard", ps, envir = envir)
  }

  utils::write.csv(timecard, paste0(Sys.Date(),'_timecard.csv'))

}
