const kotlinControlFlow = '''
# Kotlin Control Flow

Kotlin flow control statements determine the next statement to be executed. For example, the statements **if-else, if, when, while, for**, and **do** are flow control statements.

Kotlin Control Flow Statements

This tutorial will take you through all these statements one by one explaining their usage and suitable examples.

*    Kotlin If...Else Expression

*    Kotlin When Expression

*   Kotlin For Loop

*    Kotlin While Loop

*    Kotlin Break and Continue

Kotlin - if...else Expression
=============================
Kotlin **if...else** expressions works like an **if...else** expression in any other Modern Computer Programming. So let's start with our traditional if...else statement available in Kotlin.

### Syntax

The syntax of a traditional **if...else** expression is as follows:
```

if (condition) {
   // code block A to be executed if condition is true
} else {
  // code block B to be executed if condition is false
}


```
Here **if** statement is executed and the given **condition** is checked. If this condition is evaluated to **true** then code block A is executed, otherwise program goes into else part and code block B is executed.

### Example

You can try the following example:
```

fun main(args: Array<String>) {
    val age:Int = 10

    if (age > 18) {
        print("Adult")
    } else {
        print("Minor")
    }
}

```
When you run the above Kotlin program, it will generate the following output:

Minor

Kotlin if...else Expression
---------------------------

Kotlin **if...else** can also be used as an expression which returns a value and this value can be assigned to a variable. Below is a simple syntax of Kotlin **if...else** expression:

### Syntax
```

val result = if (condition) {
   // code block A to be executed if condition is true
} else {
  // code block B to be executed if condition is false
}

```
If you're using if as an expression, for example, for returning its value or assigning it to a variable, the else branch is mandatory.

### Examples
```

fun main(args: Array<String>) {
    val age:Int = 10

    val result = if (age > 18) {
        "Adult"
    } else {
        "Minor"
    }
    println(result)
}

```
When you run the above Kotlin program, it will generate the following output:

Minor

You can ommit the curly braces {} when if has only one statement:
```

fun main(args: Array<String>) {
    val age:Int = 10

    val result = if (age > 18) "Adult" else  "Minor"
    println(result)
}


```
When you run the above Kotlin program, it will generate the following output:

Minor

Kotlin if...else...if Ladder
----------------------------

You can use **else if** condition to specify a new condition if the first condition is false.

### Syntax
```

if (condition1) {
  // code block A to be executed if condition1 is true
} else if (condition2) {
  // code block B to be executed if condition2 is true
} else {
  // code block C to be executed if condition1 and condition2 are false
}

```
Kotlin Nested if Expression
---------------------------

Kotlin allows to put an **if** expression inside another **if** expression. This is called **nested** if expression

### Syntax
```

if(condition1) {
   // code block A to be executed if condition1 is true
   if( (condition2) {
      // code block B to be executed if condition2 is true
   }else{
      // code block C to be executed if condition2 is fals
   }
} else {
  // code block D to be executed if condition1 is false
}

```
### Example
```

fun main(args: Array<String>) {
    val age:Int = 20 

    val result = if (age > 12) {
       if ( age > 12 && age  < 20 ){
           "Teen"
       }else{
           "Adult"
       }
    } else {
        "Minor"
    }
    print("The value of result : ")
    println(result)
}

```
When you run the above Kotlin program, it will generate the following output:

The value of result : Adult


''';