#' Copy Stan Models
#'
#' This function extracts the Stan Code from a Package and then
#' copies it to your user cache locally.
#'
#' @param pkgname a string, the name of the package
#' @param local_location a file path representing the desired location
#'   of the local copy. If "default" is provided, the function will use
#'   the user cache directory for the package.
#' @returns file path of newly created files
#' @importFrom fs dir_create dir_exists file_copy
#' @export
#'
#' @examples
#' local_location <- tempdir()
#' copy_models(pkgname = "staninside", local_location = local_location)
copy_models <- function(pkgname = "staninside", local_location = NULL) {
  if (is.null(local_location)) {
    stop("A location must be provided")
  }

  if (local_location == "default") {
    local_location <- rappdirs::user_cache_dir(appname = pkgname)
    cli::cli_alert("`{local_location}` will be used")
  } else {
    if (!dir.exists(local_location)) {
      stop("The directory you have indicated does not exist")
    }
  }

  stan_code_to_copy <- find_stan_code(pkgname)

  pkg_location <- names(stan_code_to_copy$base_stan_location)

  new_locations_base <- gsub(pattern = ".+/stan/", "", pkg_location)

  new_locations <- file.path(local_location, new_locations_base)

  dirs_needed <- unique(dirname(new_locations_base))

  dirs_needed <- dirs_needed[dirs_needed != "."]

  dirs_needed <- dirs_needed[!grepl(dirs_needed, pattern = ".stan")]


  dirs_needed <- dirs_needed[!vapply(file.path(local_location, dirs_needed),
    function(x) fs::dir_exists(path = x),
    FUN.VALUE = logical(1)
  )]

  if (!fs::dir_exists(local_location)) {
    fs::dir_create(local_location)
  }


  if (length(dirs_needed) > 0) {
    lapply(
      file.path(local_location, dirs_needed),
      function(x) fs::dir_create(path = x, recurse = TRUE)
    )
  }

  fs::file_copy(
    path = pkg_location,
    new_path = new_locations,
    overwrite = TRUE
  )

  cli::cli_alert_success("All models have been copied to your specified location")

  invisible(new_locations)
}
