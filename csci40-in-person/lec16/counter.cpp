#include <iostream>
#include <vector>
using namespace std;

class Counter {
  public:
    // constructors
    Counter(); // default constructor
    Counter(int starting_count); // parameterized constructor

    // void init();
    void reset(int new_count);
    void inc();
    void dec();
    int getCount() const;

  private:
    int count;

    vector<int> v;
    const double d;
};

                // initializer list 
                // |
                // v
Counter::Counter() : count(0), v(100, 42), d(3.14) {
  cout << "I'm in the default constructor!\n";
  // count = 0;
}

Counter::Counter(int starting_count) : count(starting_count), d(5.67) {
  cout << "I'm in the parameterized constructor!\n";
  // count = starting_count;
}

/*
void Counter::init() {
  count = 0;
}
*/

void Counter::reset(int new_count) {
  count = new_count;
}

void Counter::inc() {
  count++;
}

void Counter::dec() {
  count--;
}

int Counter::getCount() const {
  return count;
}

int main() {
  Counter c; // this line calls the default constructor
  // c.init(); // ==> Counter::init(c)

  c.inc();
  c.inc();
  c.inc();
  cout << c.getCount() << endl;

  c.dec();
  c.dec();
  cout << c.getCount() << endl;

  c.reset(42);
  c.inc();
  cout << c.getCount() << endl;

  /////////////////////////////////////

  Counter d(33);
  d.inc();
  cout << d.getCount() << endl;

  return 0;
}
