

Here:

    https://social.msdn.microsoft.com/Forums/en-US/61c1c0c0-c1e9-47aa-b095-2ade5a28cf51/mro-36-coming?forum=ropen

Look for the title starting with:

<H4> Here is a short recipe to get Intel MKL up and running with R 3.6.2, just by copying across some of the Intel MKL BLAS files from Microsoft R Open to R 3.6.2, this is easier than having to recompile the whole of R against the Intel MKL libs<H3>


<H7>For step 4 in the recipe the Revo packages no longer works with R ver 4.X, so skip that.  Also, if needed, the doParallel package is on CRAN, download it from there.

For the Singular Value Decomposition test, getMKLthreads() no longer works, you need to use the CRAN package: 'RhpcBLASctl'. See: Controlling Multi-threading in R-MKL, Benchmarking, and Advice on Usage.md in this repo.

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
    > blas_get_num_procs()
    [1] 1

