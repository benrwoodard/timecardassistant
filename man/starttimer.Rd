\name{starttimer}
\alias{starttimer}
\title{Set the time you began working on the prject}
\usage{
starttimer(pn = "project name", starttime = Sys.time(), started = NA)
}
\description{
Sets a global variable, "ps" (project start) which is used to build the timecard data frame which is created when the "done()" function is run.
}
\examples{
starttimer(pn = "projectname")
starttimer(pn = "projectname", started = .75)
}

