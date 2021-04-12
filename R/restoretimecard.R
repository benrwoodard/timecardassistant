#' Restore the timecard
#'
#' If the timecard object has been deleted and you want to continue generating the timecard
#' records.
#'
#' @param filepath The file path of the most recent timecard csv file
#'
#' @importFrom magrittr %>%
#' @importFrom readr read_csv
#' @importFrom dplyr select
#' @importFrom dplyr mutate
#' @importFrom utils menu
#' @importFrom glue glue
#'
#' @export
#'

restortc <- function(filepath = NULL) {

if(is.null(filepath)) {
  items <- list.files(pattern = '_timecard.csv')
  lastfile <- max(items)
  ans <- utils::menu(c("Yes", "No"), title=glue::glue('Is {lastfile} your most uptodate saved timecard?'))
  }
if(ans == 1) {
  timecardupdated <- readr::read_csv(lastfile)
  timecard <- timecardupdated %>% dplyr::select(-X1) %>%
     dplyr::mutate(started = as.character(started),
           finished = as.character(finished))
  } else if(ans == 2) {
   "Please provide the filepath using the 'filepath' argument."
  } else {
   timecardupdated <- readr::read_csv(file)
   timecard <- timecardupdated %>% dplyr::select(-X1) %>%
      dplyr::mutate(started = as.character(started),
         finished = as.character(finished))
  }
}
