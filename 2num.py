import sys
from collections import defaultdict
imap = {}
jmap = {}
I = defaultdict(lambda:0)
J = 0
vocab = open("vocab", 'w')
for file in sys.argv[1:]:
  out = open(file+"n", 'w')
  for line in open(file):
    item,feat,val = line.split()
    if (file,item) not in imap:
      I[file] += 1
      imap[file,item] = I[file]
    if feat not in jmap:
      J += 1
      jmap[feat] = J
      print>>vocab, feat
    print>>out, imap[file,item], jmap[feat], val
  out.close()
