% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hcl_color_picker.R
\name{hcl_color_picker}
\alias{hcl_color_picker}
\title{Shiny app to pick colors in HCL space}
\usage{
hcl_color_picker()
}
\value{
\code{hcl_color_picker} invisibly returns a vector of colors choosen.
   If no colors have been selected \code{NULL} will be returned.
}
\description{
The app visualizes colors either along the hue-chroma plane for a given luminance value or along the
luminance-chroma plane for a given hue. Colors can be entered by specifying the hue (H), chroma (C),
and luminance (L) values via sliders, by entering an RGB hex code, or by clicking on a color in the
hue-chroma or luminance-chroma plane. It is also possible to select individual colors and add them
to a palette for comparison and future reference.
}
\examples{
\dontrun{
hcl_color_picker()
}
}
