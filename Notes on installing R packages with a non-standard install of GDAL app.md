

install.packages('rgdal', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")

library(rgdal)

install.packages('rgeos', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")

library(rgeos)

install.packages('sf', configure.args = "--with-gdal-config=/opt/gdal/gdal-2.4.1/bin/gdal-config")

library(sf)
