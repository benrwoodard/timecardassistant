\name{donetimer}
\alias{donetimer}
\title{Set the time you stopped working on the prject}
\usage{
donetimer(notes = NA, finished = NA, projectstart = ps, pf = Sys.time())
}
\description{
Sets a global variable, "timecard" using the "ps" (project start) variable that was set using the
starttimer() function. The 'notes' and 'finished' are two optional attributes to help eliminate
confusion. By assigning notes you will be able to more quickly recall what you worked on and using the
'finished' attribute you will be able to set your finished time more accurately even if you have moved on to another project.
}
\examples{
donetimer()
donetimer(notes = "optional notes")
donetimer(notes = "optional notes", finished = .25)
}

