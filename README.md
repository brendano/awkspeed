Feature number-izing timings
============================
This is code for the blog post http://anyall.org/blog/?p=652

Please contribute new implementations!  If you'd like to compare against the
same data used in the blogpost, you can get it from
http://www.cs.cmu.edu/~brendano/awkspeed/ - it's 130MB compressed, 950MB
uncompressed.

Questions to brenocon@gmail.com


Output MD5's
==============

    MD5 (1996.wctriples.pn) = f36795cf9c4dd41b69622478c3e8fd9e
    MD5 (1997.wctriples.pn) = b18fa737e799b93c05fe4fd0523fc084
    MD5 (1998.wctriples.pn) = 2fa08f9e638d1159ffe958ab60a7e08c
    MD5 (1999.wctriples.pn) = 2a6594edc30717f37a998f4c6c113f6f
    MD5 (2000.wctriples.pn) = da15012e133131d8e289b0ef117ca083
    MD5 (2001.wctriples.pn) = 5d2c4cf7844fa6afa9a3599a8d9f4812
    MD5 (2002.wctriples.pn) = 47c964797f388b2f3be6221407396a28
    MD5 (2003.wctriples.pn) = b7bee42f6b88925125aae647e527e67b
    MD5 (2004.wctriples.pn) = e80a61e7a67fcf0b30fd181e4bea0253
    MD5 (2005.wctriples.pn) = 2a877a712762174475076e7c7ae2cb9d
    MD5 (2006.wctriples.pn) = 7a8999e7f87203e7221dc7b899f1a358
    MD5 (vocab) = 8f89e81f73ff3c44e5e19c460a1cca1b


Timing results
==============
OSX 10.5, 2GHz Core 2 Duo
Median results, or so, were reported in the post

    ruby1.9 2num.rb *.p  494.19s user 6.19s system 97% cpu 8:30.90 total
    ruby1.9 2num.rb *.p  500.11s user 6.93s system 95% cpu 8:49.13 total
    ruby1.9 2num.rb *.p  499.52s user 6.98s system 96% cpu 8:44.67 total
    /usr/bin/ruby 2num.rb *.p  436.53s user 7.11s system 95% cpu 7:44.73 total
    /usr/bin/ruby 2num.rb *.p  432.30s user 6.40s system 97% cpu 7:29.79 total
    /usr/bin/ruby 2num.rb *.p  429.59s user 5.95s system 98% cpu 7:21.71 total
    java -server Formatter *.p  75.83s user 3.92s system 97% cpu 1:22.16 total
    java -server Formatter *.p  73.67s user 4.00s system 97% cpu 1:19.91 total
    java -server Formatter *.p  74.04s user 3.97s system 97% cpu 1:20.07 total
    /usr/bin/python 2num.py *.p  129.92s user 3.58s system 97% cpu 2:16.90 total
    /usr/bin/python 2num.py *.p  130.01s user 3.68s system 97% cpu 2:17.48 total
    /usr/bin/python 2num.py *.p  129.88s user 3.61s system 97% cpu 2:17.02 total
    /usr/bin/perl 2num.pl *.p  175.11s user 3.91s system 97% cpu 3:03.62 total
    /usr/bin/perl 2num.pl *.p  175.05s user 3.97s system 97% cpu 3:02.93 total
    /usr/bin/perl 2num.pl *.p  175.18s user 3.98s system 96% cpu 3:04.79 total
    mawk -f 2num.awk *.p  59.63s user 3.57s system 94% cpu 1:06.58 total
    mawk -f 2num.awk *.p  59.92s user 3.74s system 93% cpu 1:07.85 total
    mawk -f 2num.awk *.p  59.65s user 3.64s system 95% cpu 1:06.54 total
    nawk -f 2num.awk *.p  246.89s user 115.83s system 98% cpu 6:08.09 total
    nawk -f 2num.awk *.p  246.81s user 116.09s system 98% cpu 6:08.98 total
    nawk -f 2num.awk *.p  246.84s user 116.10s system 98% cpu 6:09.64 total
    gawk -f 2num.awk *.p  416.72s user 94.06s system 96% cpu 8:48.50 total
    gawk -f 2num.awk *.p  414.76s user 92.95s system 98% cpu 8:34.10 total
    gawk -f 2num.awk *.p  414.91s user 93.06s system 98% cpu 8:35.07 total
    ./2num *.p  268.27s user 134.68s system 98% cpu 6:50.80 total
    ./2num *.p  269.56s user 135.46s system 96% cpu 6:57.75 total
    ./2num *.p  268.14s user 134.35s system 98% cpu 6:49.51 total
    ./2num_c *.p  88.39s user 3.42s system 96% cpu 1:34.79 total
    ./2num_c *.p  88.40s user 3.50s system 96% cpu 1:35.09 total
    ./2num_c *.p  88.40s user 3.48s system 96% cpu 1:34.74 total
    mawk -f 2num.awk *.p  59.59s user 3.55s system 95% cpu 1:05.95 total
    mawk -f 2num.awk *.p  59.59s user 3.61s system 95% cpu 1:06.01 total
    mawk -f 2num.awk *.p  59.61s user 3.60s system 95% cpu 1:05.94 total
    java -server Formatter *.p  74.40s user 3.93s system 98% cpu 1:19.89 total
    java -server Formatter *.p  79.65s user 4.04s system 97% cpu 1:25.88 total
    java -server Formatter *.p  73.59s user 3.95s system 97% cpu 1:19.23 total
    /usr/bin/python 2num.py *.p  129.98s user 3.59s system 97% cpu 2:17.37 total
    /usr/bin/python 2num.py *.p  129.84s user 3.61s system 97% cpu 2:16.56 total
    /usr/bin/python 2num.py *.p  129.92s user 3.62s system 97% cpu 2:16.70 total
