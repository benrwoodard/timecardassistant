#' Start the timer
#'
#' This is used when you are starting a work chunk on a project. It
#' creates a global variable, 'ps', that is used to define the start
#' time of a project and helps build the 'timecard' ouput when the done()
#' function is run.
#'
#' @description Use a project name that you can reference.
#'
#' @param client Client initials ex. 1pw, gsk, ccc
#' @param pn Project Name
#' @param started The time delay in decimal hour when you started the project.
#' For example use '.50' to start the project 30 minutes ago.
#' @param starttime The time that the project started. If you started
#' earlier and want to catch up add
#'
#' @importFrom magrittr %>%
#'
#' @export
#'

starttimer <- function(client = "sdi",
                       pn = "admin",
                       started = NA,
                       starttime = Sys.time()) {

  if(!is.na(started)) {
    started = started*60*60
    starttime = starttime - started
  }

  p <- data.frame(client, pn, starttime)
  pos <- 1
  envir = as.environment(pos)
  assign("ps", p, envir = envir)
}
