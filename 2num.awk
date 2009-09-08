# USAGE: awk -f 2num.awk file1 file2 file3 ...
# Take (item, feat, value) triplets and numberize them as sparse matrices.
# Each file should have item numbers count from 1, but feat numbers are global.
# Also, save the symbolic names to a separate file.
# e.g. each file is a different cross-validation fold

!imap[FILENAME, $1] {
  imap[FILENAME, $1] = ++I[FILENAME]
}
!jmap[$2] {
  jmap[$2] = ++J
  print $2 > "vocab"
}
{ print imap[FILENAME, $1], jmap[$2], $3 > (FILENAME "n") }
