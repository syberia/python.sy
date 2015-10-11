# Python Modules for R

Python is known for a stellar [module and import system](https://docs.python.org/2/tutorial/modules.html)
that makes it incredibly easy to manage dependencies and track the
etiology of local variables and functions.

This project offers a "port" to R of Python's module system using
[syberia](https://github.com/robertzk/syberia), a development framework for R.

Installation
------------

To create a new python.sy project simply create a directory with this syberia engine:

```r
# config/application.R
name <- "python.sy project"

# config/engines.R
engine("python", type = "github", repo = "syberia/python.sy", mount = TRUE)
```

Example
-------


You can then start working with R as if it's python:

```r
# toplevel.R
from(first.second.third) %import% c("chocolate", "coconut")

list(
  chocolate = chocolate("happy"),
  coconut   = coconut("delighted")
)

# first/second/third.R
chocolate <- function(adjective) {
  sprintf("Chocolate makes me %s!", adjective)
}

chocolate <- function(coconut) {
  sprintf("Eating coconut leaves one feeling %s.", adjective)
}
```

Opening the R console from the root of the project, we notice

```r
syberia_project()$resource("toplevel")
# list(chocolate = "Chocolate makes me happy!",
#      coconut = "Eating coconut leaves me delighted.")
```

