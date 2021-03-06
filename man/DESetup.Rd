% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Setup.R
\name{DESetup}
\alias{DESetup}
\title{Setup options for RNA-seq count simulations.}
\usage{
DESetup(ngenes, nsims=25,
p.DE=0.1, p.B=NULL,
pLFC, bLFC=NULL, sim.seed)
}
\arguments{
\item{ngenes}{Number of genes to be simulated.}

\item{nsims}{Number of simulations to run. Default is 25.}

\item{p.DE}{Percentage of genes being differentially expressed (DE). Default is 10\%.}

\item{p.B}{Percentage of genes being differentially expressed between batches. Default is \code{NULL}.}

\item{pLFC}{The log2 phenotypic fold change for DE genes. This can be:
(1) a constant, e.g. 2;
(2) a vector of values with length being number of DE genes. If the input is a vector and the length is not the number of DE genes, it will be sampled with replacement to generate log-fold change;
(3) a function that takes an integer n, and generates a vector of length n, e.g. function(x) rnorm(x, mean=0, sd=1.5).}

\item{bLFC}{The log2 batch fold change for all genes. This can be:
(1) a constant, e.g. 2;
(2) a vector of values with length being number of all genes. If the input is a vector and the length is not the number of total genes, it will be sampled with replacement to generate log2 fold changes;
(3) a function that takes an integer n, and generates a vector of length n, e.g. function(x) rnorm(x, mean=0, sd=1.5).}

\item{sim.seed}{Simulation seed.}
}
\value{
A list with the following entries:
\item{ngenes}{An integer for number of genes.}
\item{nsims}{An integer for number of simulations.}
\item{sim.seed}{The specified simulation seed.}
\item{p.DE}{Percentage of DE genes.}
\item{DEid}{A list (length=nsims) of vectors (length=ngenes*p.DE) for the IDs of DE genes.}
\item{glfc}{A list (length=nsims) of vectors (length=ngenes) for phenotypic log fold change of all genes, ie nonDE=0 and DE=lfc.}
\item{blfc}{A list (length=nsims) of vectors (length=ngenes) for batch log fold change of all genes.}
\item{design}{Two group comparison}
}
\description{
This function generates a set of differential expressed gene IDs with associated fold changes for a given number of genes, simulations and fraction of DE genes.
}
\examples{
\dontrun{
desettings <- DESetup(ngenes=10000,
nsims=25,
p.DE=0.2,
pLFC=function(x) sample(c(-1,1), size=x,replace=TRUE)*rgamma(x, 3, 3))
}
}
\author{
Beate Vieth
}
