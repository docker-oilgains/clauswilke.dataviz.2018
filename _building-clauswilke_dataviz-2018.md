# Building clauswilke/dataviz 2018
[TOC]

## package dependencies

* Creating a script `install_the_packages.R` to do the package installation at once: 


```
 install.packages(c(
 				 "egg",
                 "forcats",
                 "foreign",
                 "gapminder",
                 "ggrepel", 
                 "ggridges", 
                 "ggthemes", 
                 "ggforce", 
                 "gridGraphics",
                 "ggplot2movies",
                 "gridExtra",
                 "gtable",
                 "hexbin", 
                 "lubridate",                  
                 "magick", 
                 "maps", 
                 "maptools",                  
                 "nlme", 
                 "nycflights13",
                 "plot3D",
                 "readr", 
                 "rgdal",
                 "rgeos",
                 "sf",
                 "shiny",
                 "treemapify",
                 "tidyverse"
                 "units"                 
                 ))
```

* `patchwork` is also necessary but it not in CRAN.
* WilkeLab repo: https://github.com/wilkelab

## manual dependencies

### patchwork
* Link: https://github.com/thomasp85/patchwork
* Install with:
```
devtools::install_github("thomasp85/patchwork")
```

### `sf` dependencies
* The installation of this package requires the installation of  units library in Linux:
```
# sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get update
sudo apt-get install libudunits2-dev libgdal-dev libgeos-dev libproj-dev 
```

### dependencies for `magick` in Linux
* The package `magick` requires this Linux library `magick`. Install it with:
`sudo apt-get install -y libmagick++-dev`

### Building from packages
* Packages that require manual attention: `cowplot, dviz.supp, colorspace, colorblindr`.
* `colorspace` is the more problematic because there several versions `1.4.0` but they don't not contain newer functions used in `dataviz`.

### colorspace
* The package that `dataviz` uses is not widely update through all the repositories. That's why it is being installed from the source code.

* Links to colorspace 1.4.0:
  * web page: https://r-forge.r-project.org/R/?group_id=20

  * Source: http://download.r-forge.r-project.org/src/contrib/colorspace_1.4-0.tar.gz

  * Or install with: 
    `install.packages("colorspace", repos = "http://R-Forge.R-project.org")`

    This method doesn't have newer functions in `dataviz`.

* Finally, the way it worked was copying the source code to the container and install it with:

`RUN Rscript -e "install.packages('/home/rstudio/pkg/colorspace', repos = NULL, type='source')`



### cowplot
 * repo: https://github.com/wilkelab/cowplot
 * install with: `devtools::install_github("wilkelab/cowplot")`

## Other packages

Packages `ggforce`, `patchwork`, `colorblindr`, `ggridges`, `cowplot`, `dviz.supp` are installed via `devtools::install_github`.

## Build the book
In a Linux console, run:
```
sh _build_final.sh
```

## Miscelaneous
* Add R script `install_the_packages.R` that will install all package dependencies.
* Install libraries for packages `units` and `geos` in Linux
```
sudo apt-get install libudunits2-dev libgdal-dev libgeos-dev libproj-dev
```

* Install libraries for magick in Linux
```
sudo apt-get install libmagick++-dev
```


