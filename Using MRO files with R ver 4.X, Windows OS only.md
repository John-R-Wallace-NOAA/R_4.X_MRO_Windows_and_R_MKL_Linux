






Note that sessioninfo() for a properly installed R-MKL on Linux will show a link to the Intel libraries:

    BLAS/LAPACK: /opt/intel/compilers_and_libraries_2020.1.217/linux/mkl/lib/intel64_lin/libmkl_gf_lp64.so

Whereas, R-CRAN shows the standard libraries are used:

    BLAS:   /opt/R/64-bit/R-4.0.1/lib64/R/lib/libRblas.so
    LAPACK: /opt/R/64-bit/R-4.0.1/lib64/R/lib/libRlapack.so
    
For a properly patched R ver 4.X under Windows, the sessioninfo()'s information doesn't change, however using RhpcBLASctl::blas_get_num_procs() will push the 'detected function mkl_get_max_threads' message and it will report the number of cores set as being greater than 1.  Standard R-CRAN will do neither of these things:
    
    # Patched R ver 4.X
    >  blas_set_num_threads(4)
    detected function mkl_set_num_threads
    >  blas_get_num_procs()
    detected function mkl_get_max_threads
    [1] 4
    
    
    # Unpatched R-CRAN
    > blas_set_num_threads(4)
    >  blas_get_num_procs()
    [1] 1


   
  Also getLoadedDLLs() will show that 'RhpcBLASctl.dll' is loaded.

