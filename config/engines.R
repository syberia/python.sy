.onAttach <- function(parent_engine) {
  # `director` is the base engine object.
  module_controller <- director$resource("lib/controllers/module")
  parent_engine$register_preprocessor("", module_controller$preprocessor, overwrite = TRUE)
  parent_engine$register_parser("", module_controller$parser, overwrite = TRUE)
}

