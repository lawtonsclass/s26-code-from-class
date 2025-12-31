#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
  ifstream ifs("sample-file.txt");

  string s;
  ifs >> s;
  ifs >> s;
  ifs >> s;
  ifs >> s;

  cout << ifs.eof() << endl;
  cout << s << endl;

  ifs >> s; // notices the end of the file, and the read fails!
  cout << ifs.eof() << endl;
  cout << s << endl;

  ifs.close();

  return 0;
}
