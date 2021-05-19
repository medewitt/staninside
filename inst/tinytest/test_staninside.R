
# Placeholder with simple test
expect_equal(info = "Test function can find Stan",
						 staninside::find_stan_code(pkgname = "staninside")$base_stan_location[[1]],
						 "test.stan")

expect_equal(info = "Test S3 for Print",class(staninside::find_stan_code(pkgname = "staninside")$stan_pkg_contents$test.stan),
						 c("character", "stancode"))
