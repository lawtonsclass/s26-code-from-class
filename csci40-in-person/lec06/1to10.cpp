#include <iostream>
using namespace std;

int main() {
  int i = 1;
  while (i <= 10) { // could be while (i >= 1 && i <= 10), but the i >= 1 is redundant
    cout << i << endl; // print i
    i++; // increment i by 1
  }

  cout << endl;

  int j = 1;
  int sum = 0; // repeatedly add j into sum 10 times (and increment j each time)
  while (j <= 10) {
    sum = sum + j; // adds 1 the first time, 2 the second, 3 the third, ...
    j++;
  }

  cout << sum << endl;

  cout << endl << endl;

  i = 10;
  while (i >= 0) { // could be while (i >= 0 && i <= 10), but the i <= 10 is redundant
    cout << i << endl; // print i
    i = i - 2; // could also do: i -= 2;
  }


  return 0;
}
