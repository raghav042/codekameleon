const cpp_basics = '''
# Basics of C++

C++ is a statically typed, compiled, general-purpose, case-sensitive, free-form programming language that supports procedural, object-oriented, and generic programming.

C++ is regarded as a **middle-level** language, as it comprises a combination of both high-level and low-level language features.

C++ was developed by Bjarne Stroustrup starting in 1979 at Bell Labs in Murray Hill, New Jersey, as an enhancement to the C language and originally named **C with Classes** but later it was renamed C++ in 1983.

C++ is a superset of C, and that virtually any legal C program is a legal C++ program.

**Note** − A programming language is said to use static typing when type checking is performed during compile-time as opposed to run-time.

Object-Oriented Programming
---------------------------

C++ fully supports object-oriented programming, including the four pillars of object-oriented development −

*   Classes and Objects
*   Encapsulation
*   Data Abstraction
*   Inheritance
*   Polymorphism

Advantages of C++
-----------------

C++ programming language has many advantages over other languages. Some of these advantages are listed as follows −

*   **Rich Standard Library**: C++ language provides the users with a rich and useful Standard Template Library (STL). This library has a lot of in-built methods and data structure templates to make coding in this language efficient and quick.
*   **OOPS Concepts**: C++ language provides users with Object-Oriented Programming concepts like class, object, abstraction, polymorphism and much more. Hence, it acts as a modified and better version of C programming language.
*   **Faster Performance**: C++ language is faster in comparison to other languages like Python, Go, C#, and many more. This makes it very useful in embedded systems and gaming processors.
*   **Efficient Compiler**: C++ is a compiled language. C++ compiler is very versatile, and it can accept both procedural programs as well as object oriented programs.
*   **Hardware Independent**: C++ language is independent of any hardware or system design. C++ programs work on any system that has a C++/GCC compiler installed and enabled in it.
*   **Large Support Base**: C++ is one of the most widely used programming languages across the globe. It has a vast community of developers and programmers. This can be explored on platforms like Github, Reddit, Discord, DEV, Stack Overflow, and many more.

Disadvantages of C++
--------------------

C++ programming language also has some disadvantages, which are listed below:

*   **Error Detection**: C++ provides the facility of low-level design and is very close to the hardware of the system. Hence, this may lead the user to carry out small errors that are difficult to observe and detect.
*   **Large Syntax**: C++ has a very lengthy code base, and many programmers find it difficult to write such a lengthy syntax. This has drawn backlash from the user-base of languages like Python, Go, etc., which are easier to code and simpler to execute.
*   **Learning Curve**: As compared to Python and Go, C++ has a very steep learning curve. Users feel that the initial building phase is very tough to learn, and there are many concepts that beginners find difficult to understand.

When we consider a C++ program, it can be defined as a collection of objects that communicate via invoking each other's methods. Let us now briefly look into what a class, object, method, and instance variable mean.

*   **Object** − Objects have states and behaviors. Example: A dog has states (color, name, breed) as well as behaviors (wagging, barking, eating). An object is an instance of a class.
    
*   **Class** − A class can be defined as a template/blueprint that describes the behaviors or states that object of its type supports.
    
*   **Methods** − A method is basically a behavior. A class can contain many methods. It is in methods where the logics are written, data is manipulated, and all the actions are executed.
    
*   **Instance Variables** − Each object has its own unique set of instance variables. An object's state is created by the values assigned to these instance variables.
    

C++ Program Structure
---------------------

The basic structure of a C++ program consists of the following parts:

*   **Header file inclusion section**: This is the section where we include all required header files whose functions we are going to use in the program.
*   **Namespace section**: This is the section where we use the namespace.
*   **The main() section**: In this section, we write our main code. The main() function is an entry point of any C++ programming code from where the program's execution starts.

Example

Let us look at a simple code that would print the words Hello World.
```

#include <iostream>
using namespace std;

// main() is where program execution begins.
int main() {
   cout << "Hello World"; // prints Hello World
   return 0;
}

```
### Example Explanation

Let us look at the various parts of the above program −

*   The C++ language defines several headers, which contain information that is either necessary or useful to your program. For this program, the header <iostream> is needed.
    
*   The line **using namespace std;** tells the compiler to use the std namespace. Namespaces are a relatively recent addition to C++.
    
*   The next line '**// main() is where program execution begins.**' is a single-line comment available in C++. Single-line comments begin with // and stop at the end of the line.
    
*   The line **int main()** is the main function where program execution begins.
    
*   The next line **cout << "Hello World";** causes the message "Hello World" to be displayed on the screen.

C++ Identifiers
---------------

A C++ identifier is a name used to identify a variable, function, class, module, or any other user-defined item. An identifier starts with a letter A to Z or a to z or an underscore (_) followed by zero or more letters, underscores, and digits (0 to 9).

C++ does not allow punctuation characters such as @, % within identifiers. C++ is a case-sensitive programming language. Thus, **Manpower** and **manpower** are two different identifiers in C++.

C++ Program Structure with Object-oriented Approach
---------------------------------------------------

C++ also supports the object-oriented programming approach along with the procedural programming approach.

### Example

This example demonstrates the C++ program based on an object-oriented approach.
```

#include <iostream>
using namespace std;

class Numbers {
 private:
  int a;
  int b;

 public:
  // Function to set values
  void setValues(int x, int y) {
    a = x;
    b = y;
  }

  // Function to add these numbers
  double addition() { return a + b; }

  // Function to display values
  void display() { cout << "a: " << a << ", b: " << b << endl; }
};

int main() {
  // Create an object of Numbers class
  Numbers num;

  // Set values
  num.setValues(10, 20);

  // Display the values
  num.display();

  // Find the addition
  int sum = num.addition();
  cout << "Sum of numbers: " << sum << endl;

  return 0;
}

```


''';