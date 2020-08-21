
To keep an older version of GDAL installed for the older versions of R and R-Open, the GDAL version 2.4.1 was installed in a non-standard location and hence the following configuration arguments were needed to install the following packages into R-MKL ver 4.X (should also work with R-CRAN ver 4.X, but this was not tried): 

    install.packages('rgdal', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")
    library(rgdal)
    
    
    install.packages('rgeos', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")
    library(rgeos)
    
    
    install.packages('sf', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")
    library(sf)

To see the version of an app on Linux:

    [jwallace@nwctantalus ~]$ rpm -q gdal
    gdal-1.11.4-3.el7.x86_64
    
To see the location of an app

    [jwallace@nwctantalus ~]$ rpm -ql gdal
    /usr/bin/8211createfromxml
    /usr/bin/8211dump
    /usr/bin/8211view
    /usr/bin/gdal_contour
    /usr/bin/gdal_grid
    /usr/bin/gdal_rasterize
    ...
    
Linker bindings entries for an app: 

    [jwallace@nwctantalus R]$ ldconfig -p | grep gdal
    
    
 See also 'Failing to install sf on a CentoOS machine with R 3.5.1':
 
     https://github.com/r-spatial/sf/issues/815
    
--------------------------------------------------------

Following:

    http://www.r-inla.org/download

the steps for a stable INLA install in R are:

    install.packages("BiocManager")
    BiocManager::install(version = "3.11")
    install.packages("INLA", repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable")

--------------------------------------------------------

List library paths in R on Linux:

    .libPaths()

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
