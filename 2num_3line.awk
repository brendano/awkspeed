# USAGE: awk -f 2num.awk file1 file2 file2
# Take (item, feat, value) triplets and numberize them as sparse matrices.
# Each file should have item numbers count from 1, but feat numbers are global.

!imap[FILENAME,$1] {imap[FILENAME,$1] = ++I[FILENAME]}
!jmap[$2] {jmap[$2] = ++J; print $2 > "vocab"}
{ print imap[FILENAME,$1], jmap[$2], $3 > (FILENAME "n")}
