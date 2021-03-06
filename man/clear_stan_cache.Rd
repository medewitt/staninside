% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clear_stan_cache.R
\name{clear_stan_cache}
\alias{clear_stan_cache}
\title{Clear Stan Cache}
\usage{
clear_stan_cache(pkgname)
}
\arguments{
\item{pkgname}{a string, the name of the package}
}
\value{
invisible null
}
\description{
This function clears anything that may exist in the Stan Cache. Most
Commonly if you are using the CmdStan backend, you'll have items in your
cache.
}
\section{Warning}{

This will removed cached models and requires that \code{rappdirs} is installed
}

