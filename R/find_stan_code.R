#' Find Stan Code
#'
#' This function looks for Stan code within a given R package
#' a returns a list with the Stan code location within the package
#' and the text of the code,
#'
#' @param pkgname a string, the name of the package in which to
#'     look for the Stan code.
#' @export
#' @examples
#' find_stan_code(pkgname = "staninside")

find_stan_code <- function(pkgname = "staninside"){

	assertthat::assert_that(pkgname %in% rownames(installed.packages()),
													msg = sprintf("`%s` is not an installed package.\n", pkgname))

	stan_pkg_location <- fs::dir_ls(system.file(package = pkgname),
						 glob = "*.stan", recurse = TRUE)

	stan_pkg_contents <- lapply(stan_pkg_location, readLines)

	cleaner_regex <- paste(".+",pkgname,"stan", "(.+\\.stan)", sep = "/")
	base_stan_location <- vapply(X = stan_pkg_location,
															 function(x) gsub(pattern = cleaner_regex,
															 								 replacement =  "\\1",
															 								 x),
															 FUN.VALUE = character(1))

	names(stan_pkg_contents) <- base_stan_location

	for(i in seq_along(stan_pkg_contents)){
		class(stan_pkg_contents[[i]]) <- c("character", "stancode")
	}

	return(list(base_stan_location=base_stan_location,
							stan_pkg_contents = stan_pkg_contents))
}

#'@export
print.stancode <- function(x, ...){
	cat(x, sep = "\n")
}
