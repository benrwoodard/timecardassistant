% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/starttc.R
\name{starttc}
\alias{starttc}
\title{Start the timer}
\usage{
starttc(
  client = "sdi",
  pn = "admin",
  description = "",
  started = NA,
  starttime = Sys.time()
)
}
\arguments{
\item{client}{Client initials ex. 1pw, gsk, ccc}

\item{pn}{Project Name}

\item{description}{Description of the project}

\item{started}{The time delay in decimal hour when you started the project.
For example use '.50' to start the project 30 minutes ago.}

\item{starttime}{The time that the project started. If you started
earlier and want to catch up add}
}
\description{
Use a project name that you can reference.
}
\details{
This is used when you are starting a work chunk on a project. It
creates a global variable, 'ps', that is used to define the start
time of a project and helps build the 'timecard' ouput when the done()
function is run.
}
