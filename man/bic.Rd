% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/func_visual.R
\name{bic}
\alias{bic}
\title{Calculate the BIC value for a centain beta}
\usage{
bic(beta, G, T, N, y, cen)
}
\arguments{
\item{beta}{an object "param"}

\item{G}{group indicator vector}

\item{T}{a vector of cancer feature T}

\item{N}{a vector of cancer feature N}

\item{y}{a vector of time to event}

\item{cen}{censor indicator vector}
}
\value{
the BIC value. If beta contains single lambda value, the function returns a value of bic; if the beta contains
 vector of lambda's, the function returns a vector of bic values.
}
\description{
This function calculate the BIC value from beta and the data. Here we use the number of unique beta's as the degree of freedom, and the
 number of patients of all the data sets as the sample size.
}
