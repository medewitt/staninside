test_dir <- tempdir()

setup_stan_package(loc = test_dir)

test_that("full process functional", {
  expect_true(dir.exists(file.path(test_dir, "inst", "stan")))
})
test_that("sub directories created functional", {
  expect_true(dir.exists(file.path(test_dir, "inst", "stan", "data")))
})

test_that("fails on invalid path", {
  expect_error(setup_stan_package("blerg"))
})

test_that("fails on no location", {
  expect_error(setup_stan_package())
})
