const data_types_in_cpp = '''
While writing program in any language, you need to use various variables to store various information. Variables are nothing but reserved memory locations to store values. This means that when you create a variable you reserve some space in memory.

You may like to store information of various data types like character, wide character, integer, floating point, double floating point, boolean etc. Based on the data type of a variable, the operating system allocates memory and decides what can be stored in the reserved memory.

Primitive Built-in Types
------------------------

C++ offers the programmer a rich assortment of built-in as well as user defined data types.

Several of the basic types can be modified using one or more of these type modifiers −

*   signed
*   unsigned
*   short
*   long

### Example

Following is the example, which will produce correct size of various data types on your computer.
```

#include <iostream>
using namespace std;

int main() {
   cout << "Size of char : " << sizeof(char) << endl;
   cout << "Size of int : " << sizeof(int) << endl;
   cout << "Size of short int : " << sizeof(short int) << endl;
   cout << "Size of long int : " << sizeof(long int) << endl;
   cout << "Size of float : " << sizeof(float) << endl;
   cout << "Size of double : " << sizeof(double) << endl;
   cout << "Size of wchar_t : " << sizeof(wchar_t) << endl;
   
   return 0;
}


```
This example uses **endl**, which inserts a new-line character after every line and << operator is being used to pass multiple values out to the screen. We are also using **sizeof()** operator to get size of various data types.

When the above code is compiled and executed, it produces the following result which can vary from machine to machine −

Size of char : 1

Size of int : 4

Size of short int : 2

Size of long int : 4

Size of float : 4

Size of double : 8

Size of wchar_t : 4

Derived Data Types
------------------

Data types which are obtained from pre-defined data types in C++ are known as Derived Data Types.These can be classified into four categories, namely −

### 1. Function

A function is the simplest form of user-defined data type. It includes a return type, a function name and input parameters.

#### Syntax
```

return_type function_name(input_param1, input_param2){
   <function_body>
}


```
### 2. Array

An array is a series of elements of same data type. Elements of an array are stored in contiguous memory locations in the storage.

#### Syntax
```

data_type array_name[array_size];

```
### 3. Pointer

A pointer is a reference to an element defined previously. The value of the pointer returns the address location of the element which is associated with it.

#### Syntax
```

data_type * pointer_name=& variable_name;


```
### 4. Reference

A reference variable is used to create a copy of a variable with the same reference. Hence, changes made to the reference variable also reflect on the original variable.

#### Syntax
```

data_type & reference_name= variable_name;

```

User-Defined Data Types
-----------------------

Data types which are defined by the user intuitively without using any pre-defined data types are known as User-Defined Data Types.These data types can be further categorized, namely −

### 1. Class

A class is a defined in Object Oriented Programming as a custom data type which is used to construct an object. It is the framework of an object, and it can include constructors, methods and OOP concepts like Polymorphism, Inheritance, etc.

#### Syntax
```

class Class_name{
   <class body>

   class_name(parameters) {
      <constructor body>
   }

   return_type method_name(paremeters){
      <method body>
   }

}


```
### 2. Structure (struct)

In structure data type, the user can introduce multiple primitive data types inside the struct body.

#### Syntax
```

struct struct_name{
   data_type1 var_name1;
   data_type2 var_name2;
   
}


```
### 3. Union

Union is similar to a structure. In this, the memory location of all variables is same, and all variables share the same reference. Hence, a change in one value leads to all other values getting changed.

#### Syntax
```

union union_name{
   data_type var_name1;
   data_type var_name2;
};


```
### 4. Enumeration (Enum)

Enumeration or simply enum is a user-defined data type that is used to give name to integer constants in a program. This increases the user-readability of a program.

#### Syntax
```

enum enum_name{
   var_name1 , var_name2, 
}

```
''';