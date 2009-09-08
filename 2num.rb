imap = {}
jmap = {}
i_counter = Hash.new{|h,k| h[k]=0}
j = 0
vocab = open("vocab", 'w')
ARGV.each do |file|
  out = open(file+"n", 'w')
  open(file).each do |line|
    (item, feat, val) = line.strip.split
    if !imap[[file,item]]
      i_counter[file] += 1
      imap[[file,item]] = i_counter[file]
    end
    if !jmap[feat]
      j += 1
      jmap[feat] = j
      vocab.puts feat
    end
    out.puts [imap[[file,item]], jmap[feat], val].join(" ")
  end
  out.close
end
