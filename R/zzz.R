globalVariables({

})

this_package <- function() {
  "staninside"
}


make_this_package <- function(pkg_name) {
  txt <- sprintf(
    "this_pkg <- function () {
  '%s'
}\n", pkg_name
  )

  txt
}
