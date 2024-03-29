% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/donetc.R
\name{donetc}
\alias{donetc}
\title{Stop the timer}
\usage{
donetc(finished = NA, notes = NA, projectstart = ps, pf = Sys.time())
}
\arguments{
\item{finished}{define this by using the percentage of hours (.50 = 30 minutes)
if you need to adjust when you finished working on a project}

\item{notes}{leave notes for yourself to be able to reference later}

\item{projectstart}{this is the record of the start time and project name}

\item{pf}{Project finish time defined by the time the 'done' function was called}
}
\description{
Use a project name that you can reference.
}
\details{
This stops the timer and records the time for the project.
creates a global variable, 'ps' that is used to define the start
time of a project.
}
