#include <iostream>
#include <memory>
#include <string>
#include <vector>
using namespace std;

class Animal {
 public:
  Animal(string name) : name(name) {}
  virtual void talk() = 0;  // pure virtual function

  string getName() const { return name; }

 private:
  // every Animal has a name
  string name;
};

class Cat : public Animal {
 public:
  Cat(string name) : Animal(name) {}
  void talk() override { cout << "meow!\n"; }
};

class Dog : public Animal {
 public:
  Dog(string name) : Animal(name) {}
  void talk() override { cout << "woof!\n"; }
};

int main() {
  auto c = make_shared<Cat>("Lonzo");
  auto d = make_shared<Dog>("Charlie");

  vector<shared_ptr<Animal>> v = {c, d};
  for (auto x : v) {
    cout << x->getName() << ": ";
    x->talk();
  }

  return 0;
}
