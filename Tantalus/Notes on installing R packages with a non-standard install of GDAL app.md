
To keep an older version of GDAL installed for the older versions of R and R-Open, the GDAL version 2.4.1 was installed in a non-standard location and hence the following configuration arguments were needed to install the following packages into R-MKL ver 4.X (should also work with R-CRAN ver 4.X, but this was not tried): 

    install.packages('rgdal', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")
    library(rgdal)
    
    
    install.packages('rgeos', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")
    library(rgeos)
    
    
    install.packages('sf', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")
    library(sf)
    
# ====================================================================================================================    
Following:

    http://www.r-inla.org/download

the steps for the stable INLA install are:

    install.packages("BiocManager")
    BiocManager::install(version = "3.11")
    install.packages("INLA", repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable")
