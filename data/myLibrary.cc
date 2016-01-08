#include "myLibrary.h"
    
A::A()
{
   std::cout << "This is the constructor of A" << std::endl;
}

A::~A()
{
   std::cout << "This is the destructor of A" << std::endl;
}

int CountCharacters(const std::string s)
{
   return s.size();
}
