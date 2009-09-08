open(VOCAB, ">vocab");
foreach $file (@ARGV) {
  open(IN, "<$file");
  open(OUT, ">${file}n");
  while (<IN>) {
    ($item,$feat,$val) = split(" ");
    if (!$imap{"$file $item"}) {
      $imap{"$file $item"} = ++$I{$file};
    }
    if (!$jmap{$feat}) {
      $jmap{$feat} = ++$J;
      print VOCAB $feat . "\n";
    }
    print OUT $imap{"$file $item"} . " $jmap{$feat} $val\n";
  }
  close(OUT);
}
