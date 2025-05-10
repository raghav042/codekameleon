const variable_scope_in_cpp = '''
## Variable Scope in C++

A scope is a region of the program and broadly speaking there are three places, where variables can be declared −

*   Inside a function or a block which is called local variables,
    
*   In the definition of function parameters which is called formal parameters.
    
*   Outside of all functions which is called global variables.
    

C++ variables scopes are categorized mainly two parts −

*   Local Variables
*   Global Variables

Local Variables
---------------

Variables that are declared inside a function or block are local variables. They can be used only by statements that are inside that function or block of code. Local variables are not known to functions outside their own.

### Example
```

#include <iostream>
using namespace std;
 
int main () {
   // Local variable declaration
   int a, b;
   int c;
 
   // actual initialization
   a = 10;
   b = 20;
   c = a + b;
 
   cout << c;
 
   return 0;
}


```

Global Variables
----------------

Global variables are defined outside of all the functions, usually on top of the program. The global variables will hold their value throughout the life-time of your program.

A global variable can be accessed by any function. That is, a global variable is available for use throughout your entire program after its declaration.

### Example

Following is the example using global and local variables −
```

#include <iostream>
using namespace std;
 
// Global variable declaration
int g;
 
int main () {
   // Local variable declaration
   int a, b;
 
   // actual initialization
   a = 10;
   b = 20;
   g = a + b;
  
   cout << g;
 
   return 0;
}


```

Local and Global Variables with Same Names
------------------------------------------

A program can have same name for local and global variables but value of local variable inside a function will take preference.

### Example
```

#include <iostream>
using namespace std;
 
// Global variable declaration
int g = 20;
 
int main () {
   // Local variable declaration
   int g = 10;
 
   cout << g;
 
   return 0;
}


```
When the above code is compiled and executed, it produces the following result −

10


Accessing Global Variable
-------------------------

You can access a global variable when there is a local variable with the same name by using the **SRO** (Scope Resolution Operator) **::** before the name of that variable.

### Example

In the following example, we have global and local variables with the same name, and accessing and printing the value of the global variable −
```

#include <iostream>
using namespace std;

// Global variable declaration:
int g = 20;

int main() {
   // Local variable declaration:
   int g = 10;

   cout << "Value of g (Local variable): " << g;
   cout << endl;
   
   cout << "Value of g (Global variable): " << ::g;

   return 0;
}


```
When the above code is compiled and executed, it produces the following result −

Value of g (Local variable): 10

Value of g (Global variable): 20


''';