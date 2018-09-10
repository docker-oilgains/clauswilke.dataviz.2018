# latest R (3.5.1), latest RStudio (1.1.456) as of 20180910
FROM rocker/rstudio-stable:latest

RUN apt-get -y update \
 && apt-get -y install  \
    # `expect` to be used in installations that require user input
    expect \
    # just in case, be prepared for for Java installation
    software-properties-common \
    wget \
    gnupg \
    dirmngr \
    # needed by GDAL
    python-dev \
    python-pip \
    libproj-dev \
    # svn was used to install colorspace from source, v 1.4.0
    subversion \
    # for V8
    libv8-3.14-dev

# Linux: pre-requisites gor GDAL, rgdal, rgeos and units
RUN apt-get install -y \
    libudunits2-dev \
    libgdal20 \
    libgdal-dev \
    libgeos-dev \ 
    libproj-dev 

# Linux: pre-requisites for magick
RUN apt-get install -y \
    libmagick++-dev

# Install R packages
RUN install2.r --error \
    egg \
    forcats \
    foreign \
    gapminder \
    ggrepel \
    ggridges \
    ggthemes \
    ggforce \
    gridGraphics \
    ggplot2movies \
    gridExtra \
    gtable \ 
    hexbin \
    lubridate \
    magick \
    maps \
    maptools \
    nlme \
    nycflights13 \ 
    plot3D \
    readr \
    rgdal \
    rgeos \
    sf \
    treemapify \
    tidyverse \
    units


RUN install2.r --error \
    devtools \
    bookdown \
    caTools \
    bitops \
    rgeos \
    V8 \
    concaveman \
    productplots \
    mgcv


# install from source so geom_sf() is recognized
# RUN Rscript -e "devtools::install_github('tidyverse/ggplot2', force = TRUE)"

# None of this worked. That's why we are building from source code below
# RUN Rscript -e "devtools::install_github('rforge/colorspace', subdir = 'pkg/colorspace')"
# RUN Rscript -e "remotes::install_svn('svn://r-forge.r-project.org/svnroot/colorspace/pkg/colorspace')"
# RUN Rscript -e "install.packages('colorspace', repos = 'http://R-Forge.R-project.org')"

# packages in github

# install ggforce from development version
RUN Rscript -e "devtools::install_github('thomasp85/ggforce')"

# install patchwork from Gtihub
RUN Rscript -e "devtools::install_github('thomasp85/patchwork')"

# This is the only building method that thar worked for colorspace
# It is related to some new functions such as 'scale_fill_discrete_carto'
# copy colorspace package source folder
COPY colorspace /home/rstudio/pkg/colorspace
RUN Rscript -e "install.packages('/home/rstudio/pkg/colorspace', repos = NULL, type='source')"

# Claus Wilke packages
RUN Rscript -e "devtools::install_github(c('clauswilke/colorblindr', \
                'clauswilke/ggridges', \
                'wilkelab/cowplot', \
                'clauswilke/dviz.supp'))"


# clone the book files from github and set read/write rights
RUN git clone https://github.com/clauswilke/dataviz.git /home/rstudio/book
RUN chmod a+rwx -R /home/rstudio/book


# copy the bookdown files. Not used.
  # use COPY if you have the bookdown files locally.
  # put them under a folder dataviz
  # COPY dataviz /home/rstudio
