

Here* (see also the other sites given in the footnote below):

https://social.msdn.microsoft.com/Forums/en-US/61c1c0c0-c1e9-47aa-b095-2ade5a28cf51/mro-36-coming?forum=ropen

Look for the following title (look down the page for the title, the search feature is poor):

<H4> Here is a short recipe to get Intel MKL up and running with R 3.6.2, just by copying across some of the Intel MKL BLAS files from Microsoft R Open to R 3.6.2, this is easier than having to recompile the whole of R against the Intel MKL libs</H4>

This recipe works cleanly now that MRO version 4.0.2 has been released and both RevoUtilsMath::getMKLthreads() and setMKLthreads() work again.  Note that the 'doParallel' package is on CRAN and can be easily downloaded from there.

 The get_num_cores() function, in the R CRAN package: 'RhpcBLASctl', is one way find the number of cores on a computer system. Hence:

      RevoUtilsMath::setMKLthreads(RhpcBLASctl::get_num_cores() - 1)
      
will reserve a single core for other work.  

#

Be careful since RhpcBLASctl::blas_set_num_threads() appears to work with MRO, with not only RhpcBLASctl::blas_get_num_procs() reporting the number of cores set, but even RevoUtilsMath::getMKLthreads() reports the same number of cores set. However, using the 'svdBenchMark' function in this repo it can be seen that the number of cores is not set properly. To see this, compare the following function calls :

     # The 'RevoUtilsMath' and 'RhpcBLASctl' packages need to be installed but not loaded 
     # install.packages('RhpcBLASctl')   
     
     set.seed(707)
     svdBenchMark(4000, cores = 1:6, MRO = TRUE, MKL = FALSE)
 
     set.seed(707)
     svdBenchMark(4000, cores = 1:6, MRO = FALSE, MKL = TRUE)

#

Tom Wenseleers' post also covers using Intel's latest (2019) files directly, however this currently (Nov 2021) does NOT work with R ver 4.X .

If Intel's files are directly moved under R ver 3.X, then the 'RhpcBLASctl' package functions will work (and svdBenchMark(..., MKL = TRUE) will also work correctly):

    # Patched R ver 4.X with files directly from Intel
    > blas_set_num_threads(4)
    detected function mkl_domain_set_num_threads
    
    > blas_get_num_procs()
    detected function mkl_domain_get_max_threads
    [1] 4


Note that sessionInfo() for a properly installed R-MKL on Linux (CentOS) will show a link to the Intel libraries:

    BLAS/LAPACK: /opt/intel/compilers_and_libraries_2020.1.217/linux/mkl/lib/intel64_lin/libmkl_gf_lp64.so

Whereas, vanilla R-CRAN on Linux shows the standard libraries are used:

    BLAS:   /opt/R/64-bit/R-4.0.1/lib64/R/lib/libRblas.so
    LAPACK: /opt/R/64-bit/R-4.0.1/lib64/R/lib/libRlapack.so
    
But for a patched MRO ver 4.X on Windows or MKL ver 3.X on Windows, the sessionInfo()'s information doesn't change. 

#

Here are other benchmarking runs to try with svdBenchMark():

     # Under MRO
     svdBenchMark(600, cores = c(1, 3, 6), MRO = TRUE, MKL = FALSE)  # Quick ones first to see what happens
     svdBenchMark(c(400, 500, 600), cores = c(1, 3, 6), MRO = TRUE, MKL = FALSE)
     
     svdBenchMark(6000, cores = c(1, 3, 6), MRO = TRUE, MKL = FALSE)
     svdBenchMark(c(4000, 5000, 6000), cores = c(1, 3, 6), MRO = TRUE, MKL = FALSE)
     
     
     # Under MKL
     svdBenchMark(600, cores = c(1, 3, 6), MRO = FALSE, MKL = TRUE)  # Quick ones first to see what happens
     svdBenchMark(c(400, 500, 600), cores = c(1, 3, 6), MRO = FALSE, MKL = TRUE)
     
     svdBenchMark(6000, cores = c(1, 3, 6), MRO = FALSE, MKL = TRUE)
     svdBenchMark(c(4000, 5000, 6000), cores = c(1, 3, 6), MRO = FALSE, MKL = TRUE)

See the websites below for other benchmarking scripts and results. The benchmarking results vary between MRO and MKL when using the various benchmarking functions and scripts, with no clear winner revealed.


<H4> Footnotes </H4>

*The same info can be found here:
    
https://stackoverflow.com/questions/38090206/linking-intels-math-kernel-library-mkl-to-r-on-windows
       
This site points out that "Moving the MKL libs from MRO to normal R is a breach of the license: mran.microsoft.com/assets/text/mkl-eula.txt, hence that part is only a suggestion and do so at your own legal risk.
    
Other sites of interst: 


     
Building R 4+ for Windows with OpenBLAS

https://www.avrahamadler.com/2020/05/12/building-r-4-for-windows-with-openblas/


Build R 4.0 with MKL (Commenter 'Ixxmu' writes that he got the build to work under CentOS 7, but he doesn't expalin how)

https://github.com/microsoft/microsoft-r-open/issues/116

alexisphhigh_performance_r Instructions and benchmarks for high-performance computing in R

https://github.com/alexisph/high_performance_r

Short recipe to get Intel MKL up and running with R 3.6.2   (Note that MRO is at version 4.0.2 as of 22 Nov 2021.)

https://social.msdn.microsoft.com/Forums/en-US/61c1c0c0-c1e9-47aa-b095-2ade5a28cf51/mro-36-coming?forum=ropen
         
Intel Math Kernel Library 10.1 for Windows* OS, Installation Guide 

http://registrationcenter-download.intel.com/akdlm/irc_nas/1468/mklinstall_10.1.3_win.htm#introduction


# 

Sites with benchmarking results   

Andrie's version compare vignette

https://htmlpreview.github.io/?https://github.com/andrie/version.compare/blob/master/inst/doc/version.compare.html
    
 which is linked from
 
https://github.com/andrie/version.compare
    
  
Speeding up R with Intel’s Math Kernel Library (MKL)

https://www.r-bloggers.com/2012/05/speeding-up-r-with-intels-math-kernel-library-mkl/

    
MKL multithreaded library and mclapply do not play well together

https://blog.revolutionanalytics.com/2015/10/edge-cases-in-using-the-intel-mkl-and-parallel-programming.html
    
#    
    
Older references

Extending R with Intel MKL

https://www.intel.com/content/www/us/en/developer/articles/technical/extending-r-with-intel-mkl.html

