#include <stdio.h>
#include <string>
using namespace std;
#include <ext/hash_map>
using namespace __gnu_cxx;
// You have to define a hashing function to use string keys in a hash_map? Are you kidding me?! http://www.gamedev.net/community/forums/topic.asp?topic_id=119766
namespace __gnu_cxx {
  template<>
  struct hash< std::string > {
    size_t operator( )( std::string const & s ) const {
      return __stl_hash_string( s.c_str( ) );
    }
  };
}
int main(int argc, const char **argv)
{
  hash_map<string, int> imap;
  hash_map<string, int> jmap;
  hash_map<string, int> I;
  int J=0;
  FILE *vocab = fopen("vocab", "w");
  for (int file_i=1; file_i<argc; file_i++) {
    printf("%s\n",argv[file_i]);
    string filename = argv[file_i];
    FILE *in = fopen(argv[file_i], "r");
    string outname = argv[file_i];
    outname += "n";
    FILE *out = fopen(outname.c_str(), "w");
    char item[1000], feat[1000], val[1000];
    while (fscanf(in, "%s %s %s", item, feat, val) != EOF) {
      string key = filename + " " + item;
      if (imap.find(key) == imap.end()) {
        imap[key] = ++I[filename];
      }
      if (jmap.find(feat) == jmap.end()) {
        jmap[feat] = ++J;
        fprintf(vocab, "%s\n", feat);
      }
      fprintf(out, "%d %d %s\n", imap[key], jmap[feat], val);
    }
  }
  return 0;
}
