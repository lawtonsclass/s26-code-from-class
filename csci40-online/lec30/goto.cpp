#include <iostream>
using namespace std;

int main() {
  /*
  int i = 1;
  while (true) {
    if (i > 10) {
      break;
    }

    cout << i << endl;
    i++;
  }
  */

  int i = 1;
loopstart:
  if (i > 10) {
    goto done;
  }

  cout << i << endl;
  i++;
  goto loopstart;
done:

  return 0;
}
