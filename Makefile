push:
	Rscript --vanilla _push.R

docs:
	Rscript -e "pkgdown::build_docs()"

check:
	Rscript -e "devtools::check()"