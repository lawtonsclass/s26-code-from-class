#include <iostream>
#include <fstream>
#include <cctype>
using namespace std;

string translate(const string& s) {
  if (s == "snow") {
    return "nieve";
  } else if (s == "mountain") {
    return "montagne";
  } else if (s == "footprint") {
    return "脚印";
  } else {
    return s;
  }
}

int main() {
  ifstream ifs("LetItGoLyrics.txt");

  string word;
  while (ifs >> word) {
    cout << translate(word);

    // preserve all the whitespace after this word
    while (isspace(ifs.peek())) {
      // eat it up
      char nextChar = ifs.get();
      // output that whitespace character
      cout << nextChar;
    }
  }

  ifs.close();
  

  return 0;
}
