
R-MKL ver 4.X on Linux and patching R ver 4.X with MRO files (see Using MRO files with R ver 4.X, Windows OS only.md) both require the use of the CRAN package, 'RhpcBLASctl', to control multi-threading.

    install.packages('RhpcBLASctl')
    library(RhpcBLASctl)
    
The number of CPU physical and logical processors can be found with:
    
    get_num_cores()
    get_num_procs()

Setting the number of threads to use, and checking that number is done with:
     
    blas_set_num_threads(4)
    blas_get_num_procs()
    
If you ask for more cores than the maximum available, you will get the maximum:

    blas_set_num_threads(5000) # (Inf throws an error.)
    blas_get_num_procs()

(The function names are confusing, but the maximum that can be set is the maximum number of cores. The function explanation text in the help files is consistent.)


 Here is a Cholesky Factorization test with various number cores set:
 
    for ( i in c(1, 2, 4, 8)) { 
	
	     RhpcBLASctl::blas_set_num_threads(i)
         print(RhpcBLASctl::blas_get_num_procs())
         
         # Cholesky Factorization 
         set.seed (1)
         m <- 10000
         n <- 5000
         A <- matrix (runif (m*n),m,n)
         
         # Matrix multiply
         print(system.time (B <- crossprod(A)))
		 cat("\n\n")
    }

