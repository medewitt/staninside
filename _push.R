rmarkdown::render("README.Rmd", output_file = "README.md")
pkgdown::build_site()
codemetar::write_codemeta()
