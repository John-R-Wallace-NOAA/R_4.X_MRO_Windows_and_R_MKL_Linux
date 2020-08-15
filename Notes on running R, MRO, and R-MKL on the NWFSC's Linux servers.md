
<h4> Starting R-MKL and R-Open, starting with the latest version

<h5> R-MKL ver 4.0.1

In your root folder, add the following two lines to the bottom of the '.bashrc' file: 

    source /opt/intel/compilers_and_libraries_2020/linux/mkl/bin/mklvars.sh intel64
    MKL="-Wl,--no-as-needed -lmkl_gf_lp64 -Wl,--start-group -lmkl_gnu_thread Â -lmkl_core Â -Wl,--end-group -fopenmp Â -ldl -lpthread -lm"
    
Open up a command window (if using the noMachine client, right-click on the desktop and click 'konsole')   

Change to the desired folder and run:

    /opt/R/64-bit/R-4.0.1_MKL/bin/R

  


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






<h5> R-Open ver 3.4.3

     /opt/microsoft/ropen/3.4.3/lib64/R/bin/R
