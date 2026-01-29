#include <iostream>
using namespace std;

int main() {
  /* 
  int i = 1;
  while (i <= 10) { // could be while (i >= 1 && i <= 10), but the i >= 1 is redundant
    cout << i << endl; // print i
    i++; // increment i by 1
  }
  */

  for (int i = 1; i <= 10; i++) {
    // only the "real" work goes in the body of the for loop!
    cout << i << endl;
  }

  cout << endl;

  for (int i = 20; i >= -5; i = i - 5) {
    cout << i << endl;
  }

  // cout << i << endl; // doesn't work

  {
    int x = 42;
    cout << x << endl;
    {
      int x = 55;
      cout << x << endl;
      {
        int x = 100;
        cout << x << endl;
      }
      cout << x << endl;
    }
    cout << x << endl;
  }

  // cout << x << endl; // the 42 x is gone here

  return 0;
}
