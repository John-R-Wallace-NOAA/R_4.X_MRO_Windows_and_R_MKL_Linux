svdBenchMark <- function(n = c(4000, 5000, 6000), cores = c(1, 3, 6), MRO = TRUE, MKL = FALSE) {

    for (i in (4:6)[3]) {
    
       m <- 10000
       A <- matrix (runif (m*n),m,n)
    
      cat("\nn =", n, "\n")
       
      for(j in cores) {
      
        if(MRO) {
           RevoUtilsMath::setMKLthreads(j)
           cat("\nRhpcBLASctl::nblas_get_num_procs =", RhpcBLASctl::blas_get_num_procs(), "\n")
           cat("RevoUtilsMath::getMKLthreads =", RevoUtilsMath::getMKLthreads(), "\n")
        }
        
        if(MKL) {
           if(any(installed.packages()[, 1] %in% "RevoUtilsMath"))
              RevoUtilsMath::setMKLthreads(1)
           RhpcBLASctl::blas_set_num_threads(j)
           cat("\nRhpcBLASctl::nblas_get_num_procs =", RhpcBLASctl::blas_get_num_procs(), "\n")
           cat("RevoUtilsMath::getMKLthreads =", RevoUtilsMath::getMKLthreads(), "\n")
         }
         
         print(system.time (S <- svd(A, nu=0, nv=0)))
         cat("\n\n")
        
      }  
    }
} 
