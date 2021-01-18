.onLoad <- function(libname, pkgname) {
  .auth <<- gargle::init_AuthState(
    package     = "gcal",
    auth_active = TRUE
  )
}