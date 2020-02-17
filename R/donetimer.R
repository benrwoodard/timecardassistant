#' Stop the timer
#'
#' This stops the timer and records the time for the project.
#' creates a global variable, 'ps' that is used to define the start
#' time of a project.
#'
#' @description Use a project name that you can reference.
#'
#' @include
#'

done <- function() {
  pf <-  Sys.time()
  ps <- ps %>% mutate(finishtime = pf,
                      dif = round(as.numeric(pf - starttime, units = "hours"), digits = 2))
  if(exists('timecard')) {
    timecard <-  rbind(timecard, ps)
    assign('timecard', timecard, envir = .GlobalEnv)
  } else {
    assign("timecard", ps, envir = .GlobalEnv)
  }
}
