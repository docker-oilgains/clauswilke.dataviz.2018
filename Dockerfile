# debian:stretch for R > 3.4.0
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
    subversion

# pre-requisites gor GDAL, rgdal and units
RUN apt-get install -y \
    libudunits2-dev \
    libgdal20 \
    libgdal-dev

# Install R packages
RUN install2.r --error \
    rgdal \
    sf \
    tidyverse \
    egg \
    gapminder \
    units \
    ggforce \
    ggrepel \
    ggridges \
    hexbin \
    maps \
    maptools \
    treemapify

RUN install2.r --error \
    devtools \
    bookdown \
    caTools \
    bitops \
    rgeos

# this worked. using install_svn did not work with devtools or remotes
RUN Rscript -e "devtools::install_github('rforge/colorspace', subdir = 'pkg/colorspace')"
# RUN Rscript -e "remotes::install_svn('svn://r-forge.r-project.org/svnroot/colorspace/pkg/colorspace')"

# packages in github
RUN Rscript -e "devtools::install_github(c('clauswilke/colorblindr', \
                'clauswilke/ggridges', \
                'wilkelab/cowplot', \
                'clauswilke/dviz.supp'))"

# install from source so geom_sf() is recognized
RUN Rscript -e "devtools::install_github('tidyverse/ggplot2', force = TRUE)"

# last minute additions
RUN install2.r --error \
    productplots \
    mgcv

# copy the bookdown files
# COPY dataviz /home/rstudio
RUN git clone https://github.com/clauswilke/dataviz.git /home/rstudio/book
RUN chmod a+rwx -R /home/rstudio/book
