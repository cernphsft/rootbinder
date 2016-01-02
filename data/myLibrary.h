#include <iostream>

/// A trivial class
class A {
public:
   A();
   ~A();
};

/// A trivial function
int CountCharacters(const std::string s);

/// A trivial template
template<class T>
class B {
public:
   B()
   {
      std::cout << "The typeid name of the template argument is " << typeid(T).name() << std::endl;
   }
};

