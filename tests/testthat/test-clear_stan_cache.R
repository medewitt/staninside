test_clearing_cache <- function() {
  # Copy over models
  app_loc <- tempdir()
  loc <- copy_models(pkgname = "staninside", local_location = app_loc)

  copied_over_files <- all(c("test.stan", "func.stan") %in% basename(loc))

  clear_stan_cache(pkgname = "staninside")

  all_removed <- !isTRUE(lapply(loc, file.exists))

  all(copied_over_files, all_removed)
}

test_that("stan files can be copied over and cleared", {
  expect_true(test_clearing_cache())
})
