#include <iostream>
using namespace std;

// return -n using two's complement
int negate_2s_complement(int n) {
  return ~n + 1;
}

int main() {
  cout << (11 & 6) << endl;
  cout << (11 & 8) << endl;  // because the result wasn't 0, bit 3 was set

  cout << endl;

  cout << (9 | 12) << endl;
  cout << (10 | 1) << endl;  // makes sure that the 0th bit is set

  cout << endl;

  cout << (~9) << endl;
  cout << negate_2s_complement(9) << endl;

  return 0;
}
