local({
  if (!nzchar(Sys.getenv("R_ROOT"))) {
    if (!is.element("lockbox", utils::installed.packages()[, 1])) {
      devtools::install_github("robertzk/lockbox")
    }

    Sys.setenv("R_ROOT" = "TRUE")
    on.exit(Sys.setenv("R_ROOT" = ""), add = TRUE)

    library(lockbox) # Will load the lockfile using the onLoad hook.
    try(unLoadNamespace("lockbox"), silent = TRUE)
  }
})

