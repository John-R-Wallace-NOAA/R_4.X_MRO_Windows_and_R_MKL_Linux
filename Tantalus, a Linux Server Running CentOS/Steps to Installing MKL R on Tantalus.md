


    source /opt/intel/compilers_and_libraries_2020.1.217/linux/mkl/bin/mklvars.sh intel64
    MKL="-Wl,--no-as-needed -lmkl_gf_lp64 -Wl,--start-group -lmkl_gnu_thread  -lmkl_core  -Wl,--end-group -fopenmp  -ldl -lpthread -lm"
    ./configure --prefix=/opt/R/64-bit/R-4.1.2_MKL --with-blas="$MKL" --with-lapack
    make
    make check
    make pdf
    make info
    make install
    make install-info
    make install-pdf
