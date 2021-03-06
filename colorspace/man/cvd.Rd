% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cvd.R
\docType{data}
\name{cvd}
\alias{cvd}
\alias{protanomaly_cvd}
\alias{deutanomaly_cvd}
\alias{tritanomaly_cvd}
\title{Color Vision Deficiency (CVD) Conversion Tables}
\format{Lists of 3x3 RGB-color transformation matrices for the various types of CVD. Each list contains 11 transformation matrices 
  representing increasingly severe color vision deficiency.}
\usage{
protanomaly_cvd

deutanomaly_cvd

tritanomaly_cvd
}
\description{
Conversion tables for simulating different types of color vision deficiency (CVD):
Protanomaly, deutanomaly, tritanomaly.
}
\details{
Machado et al. (2009) have established a novel model, that allows to handle normal color
vision, anomalous trichromacy, and dichromacy in a unified way. They also provide conversion
formulas along with tables of certain constants that allow to simulate various types of
CVD. See \code{\link{simulate_cvd}} for the corresponding simulation functions.
}
\references{
Machado GM, Oliveira MM, Fernandes LAF (2009).
  A Physiologically-Based Model for Simulation of Color Vision Deficiency.
  \emph{IEEE Transactions on Visualization and Computer Graphics}. \bold{15}(6), 1291--1298.
  \doi{10.1109/TVCG.2009.113}
  Online version with supplements at
  \url{http://www.inf.ufrgs.br/~oliveira/pubs_files/CVD_Simulation/CVD_Simulation.html}.
}
\seealso{
\code{\link{simulate_cvd}}
}
\keyword{datasets}
