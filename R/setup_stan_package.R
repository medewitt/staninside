#' Create Package Infrastructure for Stan Package
#'
#' Create directory and helper files for a Stan package using
#' CmdStanR
#'
#' @param loc a file.path indicating package root.
#' @param use_all a logical indicating if each section of Stan code
#'     should have it's own directory with a default of \code{TRUE}
#' @returns invisible null
#' @examples
#'
#' # Create Temporary Directory
#' temp_dir <- tempdir()
#'
#' # Now setup the structur
#' setup_stan_package(loc = temp_dir)
#'
#' # Examine output
#'
#' list.files(temp_dir, recursive = TRUE)
#' @export

setup_stan_package <- function(loc = NULL, use_all = TRUE) {
  if (is.null(loc)) {
    stop("A location must be provided")
  }

  if (!dir.exists(loc)) {
    stop("The directory you have indicated does not exist,")
  }

  target_path <- file.path(loc, "inst", "stan")
  base_program <- system.file("templates", "base",
    package = this_package()
  )

  cli::cli_inform("Creating directory structure")
  fs::dir_create(target_path, recurse = TRUE)
  fs::file_copy(
    path = base_program,
    new_path = file.path(target_path, "base.stan"), overwrite = TRUE
  )
  cli::cli_alert_info("Place your Stan programs in the `inst/stan` directory")

  if (use_all) {
    additional_directories <- c("data", "parameters", "functions")

    for (i in additional_directories) {
      fs::dir_create(file.path(target_path, additional_directories),
        recurse = TRUE
      )
    }
    cli::cli_inform("To reference Stan code in expanded directories use
   `#include functions/func.stan syntax in the appropriate block`")
  }

  if (!dir.exists(file.path(loc, "R"))) {
    dir.create(file.path(loc, "R"))
  }

  writeLines(
    text = make_this_package(basename(loc)),
    con = file.path(loc, "R", "staninside-helpers.R")
  )


  return(invisible(NULL))
}
