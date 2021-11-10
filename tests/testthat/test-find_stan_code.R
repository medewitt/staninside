
code <- find_stan_code(pkgname = "staninside")

test_that("finds stan code inside package", {
  expect_true(any(grepl("test.stan",code$base_stan_location)))
})

test_that("finds stan function inside package", {
	expect_true(any(grepl("func.stan",code$base_stan_location)))
})

test_that("fails on invalid package", {
	expect_error(find_stan_code(pkgname = "staninsidezzz"))
})

# TODO make this less fragile
extract_stan_program_class  <- function(){
	ob <- code$stan_pkg_contents[2][1][[1]]
	class(ob)
}

test_that("S3 method/class for print available", {
expect_equal(extract_stan_program_class(),
						 c("character", "stancode"))
})


