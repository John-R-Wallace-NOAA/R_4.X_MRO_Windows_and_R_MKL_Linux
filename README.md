
MRO (Microsoft Ropen):

    https://mran.revolutionanalytics.com/rro

added the  MKL (Math Kernel Library)  BLAS and LAPACK library functions which provides, among other things, auto multi-threading (you do want to supply the max threads to use on a server):

      https://software.intel.com/content/www/us/en/develop/tools/math-kernel-library.html

to a complied version of R and, along with their CRAN repository snapshot for reproducibility, made it public. 

Benchmarking is here:

     https://mran.revolutionanalytics.com/documents/rro/multithread

Their GitHub is here:

     https://github.com/microsoft/microsoft-r-open

But MS seems to have stopped supporting it, without explanation, after R ver 3.5.3. I see on the GitHub Issues that the someone tried to continue the compiling with R ver 4.X, but without success it seems.


In the Ropen forum,

     https://social.msdn.microsoft.com/Forums/en-US/61c1c0c0-c1e9-47aa-b095-2ade5a28cf51/mro-36-coming?forum=ropen

there is an entry with the title:  Short recipe to get Intel MKL up and running with R 3.6.2

I have figured out how to make that recipe work with R 4.X on Windows, but it doesn't work for Linux.


Hence, following something like:

     https://software.intel.com/content/www/us/en/develop/articles/quick-linking-intel-mkl-blas-lapack-to-r.html

Marcus was able to install R_MKL ver 4.0.1 on Tantalus.

However, getting VAST 3.X support packages to work was a struggle. See notes in this repo here:

    Notes on running R, MRO, and R-MKL on the NWFSC's Linux servers.

