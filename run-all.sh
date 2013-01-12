#!/usr/bin/env sh

file=$*
srcdir=$(dirname $1)
checkfile="$srcdir/1997.wctriples.pn"

time() {
	echo -n "$* "
	/usr/bin/time -f "%E real, %P cpu" $* > /dev/null
	checkResult || echo "TEST FAILED! ($*)"
}

compile() {
	g++ -O3 -o 2num   2num.cc
	g++ -O3 -o 2num_c 2num_c.cc
	javac Formatter.java
}

checkResult() {
	diff vocab vocab.ref && diff $checkfile $checkfile.ref
}

runAll() {
	time mawk -f 2num.awk        $file
	time mawk -f 2num_3line.awk  $file
	time ./2num                  $file
	time ./2num_c                $file
	time java -server Formatter  $file
	time ruby   2num.rb          $file
	time python 2num.py          $file
	time perl   2num.pl          $file
	time gawk -f 2num.awk        $file
	time gawk -f 2num_3line.awk  $file
	time coffee 2num.coffee      $file
}

createReferenceFiles() {
	mawk -f 2num.awk $file
	mv vocab vocab.ref
	mv $checkfile $checkfile.ref
}

cleanup(){
	rm 2num
	rm 2num_c
	rm Formatter.class
	rm vocab
	rm vocab.ref
	rm $checkfile.ref
}

compile 1>&2 2> /dev/null
createReferenceFiles
runAll
cleanup

