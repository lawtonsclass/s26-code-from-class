#include "point.h"

// *implementation* of the Point class

void Point::negate() {
  // in here, I can talk about x & y and they are the x & y that
  // belong to the current object that negate has been called on
  x = -x;
  y = -y;
}

Point Point::add(const Point& o) const {
  Point result;

  result.x = x + o.x;
  result.y = y + o.y;

  return result;
}

void Point::scale(double c) {
  x = x * c;
  y = y * c;
}

// getters
double Point::getX() const {
  return x;
}

double Point::getY() const {
  // y = 42; // this should not be allowed!
  return y;
}

// setters
void Point::setX(double d) {
  // if (d < 0) { return; }
  x = d;
}

void Point::setY(double d) {
  y = d;
}
