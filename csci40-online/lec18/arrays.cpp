#include <iostream>
using namespace std;

int main() {
  int arr[] = {5, 6, 7};
  cout << arr << endl;
  cout << &arr[0] << endl; // arr is &arr[0]
  cout << arr[0] << endl;
  cout << *arr << endl; // *arr is arr[0]

  cout << arr[1] << endl;
  cout << *(arr + 1) << endl; // equivalent to arr[1]

  int* p = arr;
  cout << p[2] << endl; // *(p + 2)

  return 0;
}
