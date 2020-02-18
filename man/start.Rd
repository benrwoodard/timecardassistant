\name{starttime}
\alias{starttime}
\title{Set the time you began working on the prject}
\usage{
start("project name")
}
\description{
Sets a global variable, "ps" (project start) which is used to build the timecard data frame which is created when the "done()" function is run.
}
\examples{
start(pn = "projectname")
}
\examples{
start(pn = "projectname", started = .75)
}
