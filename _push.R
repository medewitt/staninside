devtools::document()
devtools::build_vignettes()
devtools::build_readme()
devtools::check()

pkgdown::build_site()
codemetar::write_codemeta()
rmarkdown::render("README.Rmd", output_file = "README.md")
