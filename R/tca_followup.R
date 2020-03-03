#' Set followup and next step items.
#'
#'
#' @param how What action are you needing to take
#' @param who Who are you going to do this for/to
#' @param when When will this need to be completed
#' @param what What are the details that need to be accomplished
#' @param todos This is just pulling in the existing 'todos' dataframe if it exists
#'
#'
#' @return dataframe of todo items
#' @family project management functions
#'
#' @export

tca_followup <- function(how = 'email',
                         who = 'name',
                         when = 'today',
                         what = 'something very important',
                         status = 'unfinished',
                         todo = todos) {

  #create the unique identifier
  idfinder <- paste( sample( 1:9, 6, replace=TRUE ), collapse="" )

  #set the when as today or tomorrow's date or use the date provided
  if(tolower(when) == 'today') {
    when <- Sys.Date()
  } else if (tolower(when) == 'tomorrow') {
    when <- Sys.Date()+1
  } else if (is.numeric(when)) {
    when <- Sys.Date()+ when
  } else {
    when
  }

  #create the follow up list
  ful <- data.frame(key = idfinder,
                    how,
                    who,
                    when,
                    what,
                    status)

  ful$status <- as.character(ful$status)
  #assign the ful to a df named 'todo' in the environment
  if(exists('todos')) {
    todos_more <- rbind(todo, ful)
    assign("todos", todos_more, envir = .GlobalEnv)
  } else {
    assign("todos", ful, envir = .GlobalEnv)
  }

  #save it as csv file
  if(exists('todos')) {
    write.csv(todos, paste0(Sys.Date(),'_todos.csv'))
  } else {
    print('Error: Something went wrong unfortunately. Unnable top find a global variable named \"todos\".')
  }
}



