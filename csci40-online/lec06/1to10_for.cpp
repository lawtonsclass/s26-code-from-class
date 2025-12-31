#include <iostream>
using namespace std;

int main() {
  /*
  int i = 1;
  while (i <= 10) {
    cout << i << endl; // print i
    i++; // increment i
  }
  */

  for (int i = 1; i <= 10; i++) {
    // only the "real" work goes in the body of the for loop!
    cout << i << endl;
  }

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

  return 0;
}
