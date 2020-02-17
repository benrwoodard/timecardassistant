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
#' @example
#' starttimer('GSK - Benlysta - metrics map')
#' @include

start <- function(pn) {
  starttime <- Sys.time()
  p <- data.frame(pn, starttime)
  assign("ps", p, envir = .GlobalEnv)
}
