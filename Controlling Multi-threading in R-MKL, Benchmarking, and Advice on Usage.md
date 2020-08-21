Microsoft's R OPEN was supported for R versions 3.20 through 3.5.3 (https://mran.revolutionanalytics.com/news#r353) and used the functions getMKLthreads() and setMKLthreads() to control multi-threading.

R-MKL ver 4.X on Linux and patching R ver 4.X with MRO files (see: Using MRO files with R ver 4.X, Windows OS only.md) both require the use of the CRAN package, 'RhpcBLASctl', to control multi-threading:

    install.packages('RhpcBLASctl')
    library(RhpcBLASctl)
    
The number of CPU physical and logical processors can be found with:
    
    get_num_cores()
    get_num_procs()

Setting the number of threads to use, and checking that number, is done with:
     
    blas_set_num_threads(4)
    blas_get_num_procs()
    
If you ask for more cores than the maximum available, you will get the maximum:

    blas_set_num_threads(5000) # (Inf throws an error.)
    blas_get_num_procs()

(The function names are confusing, but the maximum that can be set is the maximum number of cores. See the blas_get_num_procs() explanation text in the help files.)


 Here is a matrix cross-product test with various numbers of cores set:
 
    for ( i in c(1, 2, 4, 8)) { 
    
         RhpcBLASctl::blas_set_num_threads(i)
         print(RhpcBLASctl::blas_get_num_procs())
        
         set.seed (1)
         m <- 3000
         n <- 5000
         A <- matrix(runif(m*n), m, n)
         
         # Matrix cross-product 
         # print(system.time (B <- t(A) %*% A)) # Same answer but slower
         print(system.time (B <- crossprod(A)))
         cat("\n\n")
    }
    


Using just the MKL/BLAS library compared to not using it, both on one core, the cross-product test is 27 times faster on my current laptop and 9.5 times faster on an available Linux server (NWFSC's Tantalus server with 32 cores (64 processors) and 256gb of memory).

Using the 'RhpcBLASctl' package, Tom Wenseleers' Singular Value Decomposition test can now be looked at over a different number of cores. Note that n = 2000 was changed to n = 3000 for greater contrast: 
    
    for ( i in c(1, 2, 4, 8)) { 
    
         RhpcBLASctl::blas_set_num_threads(i)
         print(RhpcBLASctl::blas_get_num_procs())
        
         set.seed (1)
         # Singular Value Decomposition
         m <- 10000
         n <- 3000
         A <- matrix (runif (m*n),m,n)
         print(system.time (S <- svd (A,nu=0,nv=0)))
    	 cat("\n\n")
    }
    
Here also, a large runtime savings is seen by just using the MKL/BLAS library compared to not using it, both on one core. On the aforementioned Linux server, using the MKL/BLAS library was ~21 times faster running the singular value decomposition test.

I found out about the RhpcBLASct package  here:

    https://stackoverflow.com/questions/45794290/in-r-how-to-control-multi-threading-in-blas-parallel-matrix-product
    
------
    
Finding the balance between the number of cores to use and the io (input/output) needed to farm out the information to the workers needs to be considered.  In general, CPU cycles are much faster than io. Here is one resource:

https://psu-psychology.github.io/r-bootcamp-2018/talks/parallel_r.html

"If the total compute time needed to process a queue scales linearly with the number of cores used in parallel, we say the problem has ‘linear speedup.’ This is the best case scenario, sometimes referred to as an ‘embarrassingly parallel’ problem. Much of the time, however, the compute time hits an asymptotic wall where the benefits of using additional cores are outweighed by the costs of coordinating information flow among so many workers."

----------------

CRAN information about BLAS can be found here:

    https://cran.r-project.org/doc/manuals/r-release/R-admin.html#BLAS
    
----------------

 One should be aware of the issue of "multi" multi-threading; using both the multi-threading talked about here and doing explicit parallel processing with packages such as 'parallel' and 'snow'.

This was a concern for the creator of a bioinformatics data package here:

    https://r.789695.n4.nabble.com/Control-multi-threading-in-standard-matrix-product-td4744826.html







