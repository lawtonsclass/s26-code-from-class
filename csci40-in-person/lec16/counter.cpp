#include <iostream>
#include <vector>
#include <algorithm>
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

    Counter operator+(const Counter& other) const;
    void operator++();

  private:
    int count;

    // vector<int> v;
    // const double d;
};

                // initializer list 
                // |
                // v
Counter::Counter() : count(0) {
  cout << "I'm in the default constructor!\n";
  // count = 0;
}

Counter::Counter(int starting_count) : count(starting_count) {
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

// option 1
Counter Counter::operator+(const Counter& other) const {
  Counter result;
  result.count = count + other.count;
  return result;
}

/*
// option 2
Counter operator+(const Counter& a, const Counter& b) {
  Counter result(a.getCount() + b.getCount());
  return result;
}
*/

void Counter::operator++() {
  // inc(); // this calls inc on the current object
  count++;
}

bool operator<(const Counter& a, const Counter& b) {
  return a.getCount() < b.getCount();
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
  
  /////////////////////////////////////

  Counter sum = c + d; // C++ tries to call c.operator+(d) OR
                       // operator+(c, d)
  cout << sum.getCount() << endl;

  // sum.inc();
  ++sum; // sum.operator++() / operator++(sum)
  cout << sum.getCount() << endl;

  vector<Counter> v = {sum, c, d};
  sort(v.begin(), v.end()); // sort will call operator<
                            // c < d turns into either:
                            //   - c.operator<(d), OR
                            //   - operator<(c, d)

  for (Counter ctr : v) {
    cout << ctr.getCount() << " ";
  }
  cout << endl;

  return 0;
}
