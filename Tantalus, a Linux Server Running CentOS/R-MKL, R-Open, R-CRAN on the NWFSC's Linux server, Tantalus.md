
<h3> Starting R-MKL </h3>

<h5> R-MKL ver 4.0.1 </h5>

In your root folder, add the following two lines to the bottom of the '.bashrc' file (not needed for R < ver 4.X): 

    source /opt/intel/compilers_and_libraries_2020/linux/mkl/bin/mklvars.sh intel64
    MKL="-Wl,--no-as-needed -lmkl_gf_lp64 -Wl,--start-group -lmkl_gnu_thread Â -lmkl_core Â -Wl,--end-group -fopenmp Â -ldl -lpthread -lm"
    
Open up a command window (if using the noMachine client, right-click on the desktop and click 'konsole')   

Change to the desired folder and run:

    /opt/R/64-bit/R-4.0.1_MKL/bin/R
    
All 3 lines can be put in the console window if desired:

    source /opt/intel/compilers_and_libraries_2020/linux/mkl/bin/mklvars.sh intel64
    MKL="-Wl,--no-as-needed -lmkl_gf_lp64 -Wl,--start-group -lmkl_gnu_thread Â -lmkl_core Â -Wl,--end-group -fopenmp Â -ldl -lpthread -lm"
    /opt/R/64-bit/R-4.0.1_MKL/bin/R
    
but, without adding the first 2 lines to your .bashrc file, this will have to done for each new console window opened. 
    
Look at the session info:

    > sessionInfo()
    R version 4.0.1 (2020-06-06)
    Platform: x86_64-pc-linux-gnu (64-bit)
    Running under: CentOS Linux 7 (Core)
    
    Matrix products: default
    BLAS/LAPACK: /opt/intel/compilers_and_libraries_2020.1.217/linux/mkl/lib/intel64_lin/libmkl_gf_lp64.so
    
    locale:
     [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
     [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
     [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
     [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
     [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    
    attached base packages:
    [1] stats     graphics  grDevices utils     datasets  methods   base     
    
    loaded via a namespace (and not attached):
    [1] compiler_4.0.1
     
<h3> Starting R-Open </h3>
    
<h5> R-Open ver 3.5.3 </h5>

     /opt/microsoft/ropen/3.5.3/lib64/R/bin/R
  
Look at the session info:

    > sessionInfo()
    R version 3.5.3 (2019-03-11)
    Platform: x86_64-pc-linux-gnu (64-bit)
    Running under: CentOS Linux 7 (Core)
    
    Matrix products: default
    BLAS: /opt/microsoft/ropen/3.5.3/lib64/R/lib/libRblas.so
    LAPACK: /opt/microsoft/ropen/3.5.3/lib64/R/lib/libRlapack.so
    
    locale:
     [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
     [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
     [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
     [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
     [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    
    attached base packages:
    [1] stats     graphics  grDevices utils     datasets  methods   base     
    
    other attached packages:
    [1] RevoUtils_11.0.3     RevoUtilsMath_11.0.0
    
    loaded via a namespace (and not attached):
    [1] compiler_3.5.3




<h5> R-Open ver 3.4.3 </h5> 

     /opt/microsoft/ropen/3.4.3/lib64/R/bin/R
     
Look at the session info:

    > sessionInfo()
    R version 3.4.3 (2017-11-30)
    Platform: x86_64-pc-linux-gnu (64-bit)
    Running under: CentOS Linux 7 (Core)
    
    Matrix products: default
    BLAS: /opt/microsoft/ropen/3.4.3/lib64/R/lib/libRblas.so
    LAPACK: /opt/microsoft/ropen/3.4.3/lib64/R/lib/libRlapack.so
    
    locale:
     [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
     [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
     [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
     [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
     [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    
    attached base packages:
    [1] stats     graphics  grDevices utils     datasets  methods   base     
    
    other attached packages:
    [1] RevoUtils_10.0.7     RevoUtilsMath_10.0.1
    
    loaded via a namespace (and not attached):
    [1] compiler_3.4.3
    
    
<h3> Starting R-CRAN </h3>
    
For standard R-CRAN use:
    
    /opt/R/64-bit/R-X.Y.Z/bin/R

for the following R-CRAN versions:

R-3.4.3, R-3.5.1, R-3.6.1, R-3.6.2, R-3.6.3, R-4.0.1

For example, for R-4.0.1 use:

    /opt/R/64-bit/R-4.0.1/bin/R
    
Look at the session info:

    > sessionInfo()
    R version 4.0.1 (2020-06-06)
    Platform: x86_64-pc-linux-gnu (64-bit)
    Running under: CentOS Linux 7 (Core)
    
    Matrix products: default
    BLAS:   /opt/R/64-bit/R-4.0.1/lib64/R/lib/libRblas.so
    LAPACK: /opt/R/64-bit/R-4.0.1/lib64/R/lib/libRlapack.so
    
    locale:
     [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
     [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
     [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
     [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
     [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    
    attached base packages:
    [1] stats     graphics  grDevices utils     datasets  methods   base     
    
    loaded via a namespace (and not attached):
    [1] compiler_4.0.1
    
Note that using just 'R' in the command window will give R-Open ver 3.5.3. (The information found by typing 'Rlist' at the command prompt is slightly out of date, as of 18 Aug 2020.)
