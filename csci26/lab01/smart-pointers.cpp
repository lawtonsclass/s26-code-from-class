#include <iostream>
#include <memory>
using namespace std;

class C {
 public:
  int x;
  ~C() { cout << "C's destructor\n"; }
};

int main() {
  // p points to a new int on the heap, with the value 42
  // unique_ptr<int> is kind of like int*
  unique_ptr<int> p = make_unique<int>(42);
  cout << *p << endl;

  unique_ptr<C> p2 = make_unique<C>();

  // unique_ptr<C> p_2_copy = p2;
  // can't do the above because the ptr is supposed to be
  // unique (you can use move to move it, though)

  // The pointers inside p and p2 get deleted automatically for us right before
  // main returns

  shared_ptr<int> p3 = make_shared<int>(43);
  // this is instead of saying int* p3 = new int(43);
  cout << *p3 << endl;

  shared_ptr<C> p4 = make_shared<C>();
  shared_ptr<C> p5 = p4;  // it's okay to copy around shared_ptrs
  p5->x = 44;
  cout << p4->x << endl;

  return 0;
}
