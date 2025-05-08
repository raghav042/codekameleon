const token_in_cpp = '''
# Tokens in C++

C++ tokens are the smallest individual units of a program, that the compiler recognizes and processes. Together, they form the syntax of C++ code, the same as combining words to form a sentence.

C++ is the superset of [C](https://www.tutorialspoint.com/cprogramming/index.htm) and so most constructs of C are legal in C++ with their meaning and usage unchanged. So tokens, expressions, and data types are similar to that of C.

Here are the following C++ tokens given below

*   Keywords
*   Identifiers
*   Constants
*   Variables
*   Operators
*   Punctuation

Keywords
--------

Keywords are reserved words which have fixed meaning, and its meaning cannot be changed. The meaning and working of these keywords are already known to the compiler. C++ has more numbers of keyword than C, and those extra ones have special working capabilities.

### List of some commonly used keywords

*   **Control flow:** if, else, switch, case, break, continue, return, goto
*   **Data types:** int, char, double, float, bool, void, long, short
*   **Storage classes:** static, extern, mutable, register, volatile
*   **Object-oriented programming:** class, struct, public, private, protected, virtual, this, friend
*   **Other:** namespace, using, typedef, const, sizeof, typeid, template, new, delete

Identifiers
-----------

Identifiers are names given to different entries such as variables, structures, and functions, classes, objects, arrays, etc. Also, identifier names should have to be unique because these entities are used in the execution of the program.

Identifier naming conventions

*   Only alphabetic characters starting with a letter (A-Z, a-z), digits (0-9), and underscores (_) are permitted.
*   The first letter must be an **alphabet** or **underscore (_)** not a number.
*   Identifiers are case sensitive.
*   Reserved keywords can not be used as an identifier's name.

Constants
---------

Constants are like a variable, except that their value never changes during execution once defined.

There are two other different ways to define constants in C++. These are:

*   By using **const** keyword
*   By using #define preprocessor

### Syntax to declare a constant

const [data_type] [constant_name]=[value];

Variables
---------

A variable is a meaningful name of data storage location in computer memory. When using a variable you refer to memory address of computer.

### Syntax to declare a variable

[data_type] [variable_name];

### Example

```

#include <iostream>
using namespace std;

int main() {

    string name = "TutorialsPoint";   // String type variable
    int started_year = 2006;  // Integer type variable
    double pi = 3.14159;    // Double type variable
    char grade = 'A';       // Char type variable
    bool isActive = true;   // Bool type variable
    return 0;
}


```
Operators
---------

C++ operator is a symbol that is used to perform mathematical or logical manipulations.

*   Arithmetic Operators
*   Increment and Decrement Operators
*   Relational Operators
*   Logical Operators
*   Bitwise Operators
*   Assignment Operators
*   Misc Operators
''';