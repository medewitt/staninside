# Make model available

local_location <- tempdir()
copy_models(pkgname = "staninside", local_location  = local_location)

test_stan <- list.files(local_location, full.names = TRUE, pattern = "test.stan")

test_that("models from test package have been copied", {
  expect_true(file.exists(test_stan))
})

test_that("test that all stan directories are available", {
	expect_true(dir.exists(file.path(local_location, "functions")))
})


