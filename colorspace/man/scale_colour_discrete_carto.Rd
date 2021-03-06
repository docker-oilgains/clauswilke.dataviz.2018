% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_carto.R
\name{scale_colour_discrete_carto}
\alias{scale_colour_discrete_carto}
\alias{scale_color_discrete_carto}
\alias{scale_fill_discrete_carto}
\title{Discrete CARTO scales for ggplot2, emulated by HCL palettes}
\usage{
scale_colour_discrete_carto(palette = "DarkMint", c1 = NULL, c2 = NULL,
  c3 = NULL, l1 = NULL, l2 = NULL, l3 = NULL, h1 = NULL, h2 = NULL,
  h3 = NULL, p1 = NULL, p2 = NULL, p3 = NULL, p4 = NULL, alpha = 1,
  rev = FALSE, nmax = NULL, order = NULL, aesthetics = "colour", ...)

scale_color_discrete_carto(...)

scale_fill_discrete_carto(...)
}
\arguments{
\item{palette}{The name of the palette to be used.}

\item{h1, h2, h3, c1, c2, c3, l1, l2, l3, p1, p2, p3, p4}{Parameters to customize the scale. See \code{\link{carto_hcl}} for details.}

\item{alpha}{Numeric vector of values in the range \code{[0, 1]} for alpha transparency channel (0 means transparent and 1 means opaque).}

\item{rev}{If \code{TRUE}, reverses the order of the colors in the color scale.}

\item{nmax}{Maximum number of different colors the palette should contain. If not provided, is calculated automatically
from the data.}

\item{order}{Numeric vector listing the order in which the colors should be used. Default is \code{1:nmax}.}

\item{aesthetics}{The ggplot2 aesthetics to which this scale should be applied.}

\item{...}{common discrete scale parameters: \code{name}, \code{breaks}, \code{labels}, \code{na.value}, \code{limits} and \code{guide}. See
\code{\link[ggplot2]{discrete_scale}} for more details.}
}
\description{
Discrete ggplot2 color scales using the color palettes generated by \code{\link{carto_hcl}}.
}
\details{
Available sequential palettes: RedOr, OrYel, Peach, PinkYl, Mint, BluGrn,
DarkMint, Emrld, ag_GrnYl, BluYl, Teal, TealGrn, PurpOr, Sunset, Magenta.

Available diverging palettes: ArmyRose, Fall, Geyser, Temps, Tropic, Earth.

If both a valid palette name and palette parameters are provided then the provided palette parameters overwrite the parameters in the
named palette. This enables easy customization of named palettes.
}
\examples{
library(ggplot2)

# default color scale
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() + theme_minimal() + 
  scale_color_discrete_carto()

# color scale "Tropic"
ggplot(iris, aes(Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.7) + theme_classic() +
    scale_fill_discrete_carto(palette = "Tropic", rev = TRUE)
    
# use `nmax` and `order` to skip some colors
ggplot(iris, aes(Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.7) + theme_classic() +
    scale_fill_discrete_carto(palette = "Tropic", nmax = 5, order = c(1, 4, 5))
}
