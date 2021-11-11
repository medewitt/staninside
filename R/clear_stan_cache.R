#' Clear Stan Cache
#'
#' This function clears anything that may exist in the Stan Cache. Most
#' Commonly if you are using the CmdStan backend, you'll have items in your
#' cache.
#' @param pkgname a string, the name of the package
#' @section Warning:
#' This will removed cached models and requires that `rappdirs` is installed
#' @returns invisible null
#' @export

clear_stan_cache <- function(pkgname){
	requireNamespace(pkgname)
	app_loc <- rappdirs::user_cache_dir(pkgname)
	unlink(app_loc, recursive = TRUE)
	invisible(NULL)
}
