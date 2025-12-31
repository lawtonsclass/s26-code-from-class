#include <iostream>
#include <string>
using namespace std;

int main() {
  string s = "abcd";
  string* sp = &s;

  // cout << sp.size() << endl;
  
  cout << (*sp).size() << endl;
  // or, equivalently
  cout << sp->size() << endl;

  return 0;
}
