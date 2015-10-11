list(
  preprocessor = function(source, source_env, director, resource) {
    inject_env <- new.env(parent = parent.env(source_env))
    inject_env$`from` <- function(target) {
      target <- substitute(target)
      target <- chartr(".", "/", target)
      dir    <- dirname(resource)
      target <- if (dir == "." || dir == "/") target else file.path(base, target)

      invisible(structure(list(target = target), class = "from_directive"))
    }

    inject_env$`%import%` <- function(from, imports) {
      stopifnot(is(from, "from_directive"))
      stopifnot(is.character(imports), all(nzchar(imports)), !any(is.na(imports)))
      candidate_imports <- director$resource(from$target, all = TRUE)
      nonexistent <- setdiff(imports, names(candidate_imports))

      if (length(nonexistent) > 0) {
        stop(sprintf("Attempted to import non-existent exports %s from %s",
          paste(vapply(nonexistent, sQuote, character(1)), collapse = ", "),
          sQuote(from$target)), call. = FALSE)
      }

      list2env(candidate_imports[imports], envir = parent.frame())
    }

    parent.env(source_env) <- inject_env
    source()
  },

  parser = function(args, input, output) {
    if (isTRUE(args$all)) {
      as.list(input)
    } else {
      output
    }
  }
)

