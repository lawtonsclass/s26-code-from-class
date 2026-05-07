#include <cstdio>
#include <cstring>
using namespace std;

int main(int argc, char* argv[]) {
  if (strcmp(argv[1], "password123") == 0) {
    printf("Access granted\n");
  } else {
    printf("Access denied\n");
  }

  return 0;
}
