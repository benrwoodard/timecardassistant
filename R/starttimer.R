#' Start the timer
#'
#' This is used when you are starting a work chunk on a project. It
#' creates a global variable, 'ps', that is used to define the start
#' time of a project and helps build the 'timecard' ouput when the done()
#' function is run.
#'
#' @description Use a project name that you can reference.
#'
#' @import Tidyverse
#' @param pn Project Name
#' @param starttime The time that the project started. If you started
#' earlier and want to catch up add
#' @param started The time delay in decimal hour when you started the project.
#' For example use '.50' to start the project 30 minutes ago.
#' @include

start <- function(pn, starttime = Sys.time(), started = NA) {
  if(!is.na(started)) {
    started = started*60*60
    starttime = starttime - started
  }

  p <- data.frame(pn, starttime)
  assign("ps", p, envir = .GlobalEnv)
}
