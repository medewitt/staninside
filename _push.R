devtools::document()
devtools::build_readme()
devtools::build_vignettes()
devtools::check()

rmarkdown::render("README.Rmd", output_file = "README.md")
pkgdown::build_site()
codemetar::write_codemeta()
