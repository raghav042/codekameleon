const kotlin_basics = '''
## Kotlin Program Entry Point

An entry point of a Kotlin application is the **main()** function. A function can be defined as a block of code designed to perform a particular task.

Let's start with a basic Kotlin program to print "Hello, World!" on the standard output:

**Code Example:**
```kotlin
fun main() {
   var string: String  = "Hello, World!"
   println(string)
}
```
When you run the above Kotlin program, it will generate the following output:

### Hello, World!

Just like most modern languages, Kotlin supports single-line (or end-of-line) and multi-line (block) comments. Kotlin comments are very much similar to the comments available in Java, C and C++ programming languages.

## Kotlin Single-line Comments

Single line comments in Kotlin starts with two forward slashes **//** and end with end of the line. So any text written in between **//** and the end of the line is ignored by Kotlin compiler.

Following is the sample Kotlin program which makes use of a single-line comment:
```

// This is a comment

fun main() {
    println("Hello, World!")
}

```

When you run the above Kotlin program, it will generate the following output:

### Hello, World!

## Kotlin Multi-line Comments

Following is the sample Kotlin program which makes use of a multi-line comment:
```

/* This is a multi-line comment and it can span
 * as many lines as you like 
 */

fun main() {
    println("Hello, World!")
}

```
## Keywords

Kotlin keywords are predefined, reserved words used in Kotlin programming that have special meanings to the compiler. These words cannot be used as an identifier (variables names, package names, function names etc.) and if used then compiler will raise an exception.

Kotlin uses **fun** keyword to define a function, so if we we will try to use it as a variable name then it will be an exception. For example:

```

fun main() {
   var fun = "Some Name"  // Not allowed, throws an exception
   var age = 19          // Valid variable name

   println("Name = " + fun)
   println("Age = " + age)
}


```

## Variables

Variables are an important part of any programming. They are the names you give to computer memory locations which are used to store values in a computer program and later you use those names to retrieve the stored values and use them in your program.

Kotlin variables are created using either **var** or **val** keywords and then an equal sign **\=** is used to assign a value to those created variables.

### **Syntax**

Following is a simple syntax to create two variables and then assign them different values:
```

var name = "Some Name"
var age = 19
var height = 5.2


```
### **Examples**

Once a variable is created and assigned a value, later we can access its value using its name as follows:
```

fun main() {
   var name = "Some Name"
   var age = 19

   println(name)
   println(age)
}

```
When you run the above Kotlin program, it will generate the following output:

Some Name

19

In Kotlin, variables are categorized primarily by mutability.

-  **Immutable (val):** Variables declared with `val` are read-only and their values cannot be changed after initial assignment.
-  **Mutable (var):** Variables declared with `var` can be reassigned new values as needed.

## Data Types

Kotlin data type is a classification of data which tells the compiler how the programmer intends to use the data. For example, Kotlin data could be numeric, string, boolean etc.

Kotlin treats everything as an object which means that we can call member functions and properties on any variable.

Kotlin is a statically typed language, which means that the data type of every expression should be known at compile time.

Kotlin built in data type can be categorized as follows:

- Number
    
- Character
    
- String
   
- Boolean
    
- Array


Now you know the basics of Kotlin! Let’s explore more next!

 ''';