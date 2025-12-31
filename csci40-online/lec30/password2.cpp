#include <cstdio>
#include <cstring>
using namespace std;

int main(int argc, char* argv[]) {
  if (argv[1][3] == 'C') {
    printf("Access granted\n");
  } else {
    printf("Access denied\n");
  }

  return 0;
}
