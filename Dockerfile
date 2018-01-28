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
    subversion \
    # for V8
    libv8-3.14-dev

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
    rgeos \
    V8 \
    concaveman \
    productplots \
    mgcv


# install from source so geom_sf() is recognized
RUN Rscript -e "devtools::install_github('tidyverse/ggplot2', force = TRUE)"

# this worked. using install_svn did not work with devtools or remotes
RUN Rscript -e "devtools::install_github('rforge/colorspace', subdir = 'pkg/colorspace')"
# RUN Rscript -e "remotes::install_svn('svn://r-forge.r-project.org/svnroot/colorspace/pkg/colorspace')"

# RUN install2.r --error \
#     V8 \
#     concaveman

RUN Rscript -e "devtools::install_github('thomasp85/ggforce')"

# packages in github
RUN Rscript -e "devtools::install_github(c('clauswilke/colorblindr', \
                'clauswilke/ggridges', \
                'wilkelab/cowplot', \
                'clauswilke/dviz.supp'))"

# # last minute additions
# RUN install2.r --error \
#     productplots \
#     mgcv

# copy the bookdown files
  # use COPY if you have the bookdown files locally
  # COPY dataviz /home/rstudio

# clone the book files from github and set read/write rights
RUN git clone https://github.com/clauswilke/dataviz.git /home/rstudio/book
RUN chmod a+rwx -R /home/rstudio/book
