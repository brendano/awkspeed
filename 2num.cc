#include <iostream>
#include <sstream>
#include <fstream>
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
  ofstream vocab("vocab");
  for (int file_i=1; file_i<argc; file_i++) {
    string filename = argv[file_i];
    cout <<filename<<endl;
    ifstream in(argv[file_i]);
    string outname = argv[file_i];
    outname += "n";
    ofstream out(outname.c_str(), ofstream::out);
    string line;
    while(getline(in, line)) {
      string item, feat, val;
      istringstream linestr(line);
      linestr >> item >> feat >> val;
      string key = filename + " " + item;
      imap.find(key);
      if (imap.find(key) == imap.end()) {
        imap[key] = ++I[filename];
      }
      if (jmap.find(feat) == jmap.end()) {
        jmap[feat] = ++J;
        vocab << feat << endl;
      }
      out <<imap[key]<<" "<<jmap[feat]<<" "<<val<<endl;
    }
  }
  return 0;
}
