Using the Makevars file:
       
     CXX14 = /opt/rh/devtoolset-7/root/usr/bin/g++
     CXX14FLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function -fPIC
     CXX14FLAGS+=-flto -Wno-unused-local-typedefs
     LDFLAGS=-L/opt/rh/devtoolset-7/root/usr/lib/gcc/x86_64-redhat-linux/7
     
found at the very bottom of:

https://discourse.mc-stan.org/t/rstan-fails-to-install-on-centos-7/15957/11

I was able to to install RStan 2.21.1 under CentOS 7. (It is a long install process.)

The Makevars file is located in the '.R' folder under the user's root directory.

There was a few missed auto-load packaages that needed to be installed first, including 'stringi' and 'tibble'.

Also, I needed to install 'shiny' first before 'shinystan' would install. 'shinystan's attempt at first installing 'shiny' failed. 

In addition, 'igraph', needed by 'shinystan' didn't install properly until after I used this Makevars (but other things may have got fixed).

Lastly, before finding and using these Makevars settings I tried using the lightweight interface 'cmdstanr', but that didn't work until RStan was working.

'cmdstanr' may have worked without RStan if I had installed it with this Makevars.



