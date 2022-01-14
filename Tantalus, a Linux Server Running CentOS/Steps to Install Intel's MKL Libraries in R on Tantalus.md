
Steps to install Intel's MKL libraries on Tantalus:
    
     1. source /opt/intel/compilers_and_libraries_2020.1.217/linux/mkl/bin/mklvars.sh intel64
     2. MKL="-Wl,--no-as-needed -lmkl_gf_lp64 -Wl,--start-group -lmkl_gnu_thread  -lmkl_core  -Wl,--end-group -fopenmp  -ldl -lpthread -lm"
     3. ./configure --prefix=/opt/R/64-bit/R-4.1.2_MKL --with-blas="$MKL" --with-lapack
     4. make
     5. make check
     6. make pdf
     7. make info
     8. make install
     9. make install-info
    10. make install-pdf

This installs the R-MKL here: 

     /opt/R/64-bit/R-4.1.2_MKL/

From a console window, R-MKL is started with:

    /opt/R/64-bit/R-4.1.2_MKL/bin/R

