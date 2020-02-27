#include <iostream>

extern "C" int arithm();
using namespace std;
int main(){
  int product;
  std::cout << "Welcome to Open Source Assembly Programming...\n";
  product = arithm();
  std::cout << "The main function received this number: " << product << ".\n";
  std::cout << "Main will now return 0 to the operating system\n";

  return 0;
}
