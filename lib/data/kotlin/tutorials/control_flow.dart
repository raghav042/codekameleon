const kotlinControlFlow = '''
# Kotlin Control Flow

Kotlin flow control statements determine the next statement to be executed. For example, the statements **if-else, if, when, while, for**, and **do** are flow control statements.

Kotlin Control Flow Statements

This tutorial will take you through all these statements one by one explaining their usage and suitable examples.

*    Kotlin If...Else Expression

*    Kotlin When Expression

*    Kotlin For Loop

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

Kotlin - When Expression
=============================
Consider a situation when you have large number of conditions to check. Though you can use **if..else if** expression to handle the situation, but Kotlin provides **when** expression to handle the situation in nicer way. Using **when** expression is far easy and more clean in comparison to writing many **if...else if** expressions. Kotlin **when** expression evaluates a section of code among many alternatives as explained in below example.

Kotlin **when** matches its argument against all branches sequentially until some branch condition is satisfied.

### Example
```

fun main(args: Array<String>) {
   val day = 2

   val result = when (day) {
     1 -> "Monday"
     2 -> "Tuesday"
     3 -> "Wednesday"
     4 -> "Thursday"
     5 -> "Friday"
     6 -> "Saturday"
     7 -> "Sunday"
     else -> "Invalid day."
   }
   println(result)
}


```

When you run the above Kotlin program, it will generate the following output:

Tuesday

Kotlin when as Statement
------------------------

Kotlin **when** can be used either as an expression or as a statement, simply like a switch statement in Java. If it is used as an expression, the value of the first matching branch becomes the value of the overall expression.

### Example

Let's write above example once again without using expression form:
```

fun main(args: Array<String>) {
   val day = 2

   when (day) {
     1 -> println("Monday")
     2 -> println("Tuesday")
     3 -> println("Wednesday")
     4 -> println("Thursday")
     5 -> println("Friday")
     6 -> println("Saturday")
     7 -> println("Sunday")
     else -> println("Invalid day.")
   }
}

```
When you run the above Kotlin program, it will generate the following output:

Tuesday

Combine when Conditions
-----------------------

We can combine multiple **when** conditions into a single condition.

### Example
```

fun main(args: Array<String>) {
   val day = 2

   when (day) {
     1, 2, 3, 4, 5 -> println("Weekday")
     else -> println("Weekend")
   }
}

```
When you run the above Kotlin program, it will generate the following output:

Weekday

What are loops?
---------------

Imagine a situation when you need to print a sentence 20 times on your screen. You can do it by using print statement 20 times. What about if you need to print the same sentence one thousand times? This is where we need to use loops to simplify the programming job. Actually, Loops are used in programming to repeat a specific block of code until certain condition is met.

Kotlin supports various types of loops.

Kotlin For Loop
---------------

Kotlin **for** loop iterates through anything that provides an iterator ie. that contains a countable number of values, for example arrays, ranges, maps or any other collection available in Kotlin. Kotlin **for** loop is equivalent to the **foreach** loop in languages like C#.

> Kotlin does not provide a conventional **for** loop which is available in C, C++ and Java etc.

### Syntax

The syntax of the Kotlin **for** loop is as follows:
```

for (item in collection) {
    // body of loop
}


```
Following is an example where we used for loop to iterate through an array of strings:
```

fun main(args: Array<String>) {
   var fruits = arrayOf("Orange", "Apple", "Mango", "Banana")
   
   for (item in fruits) {
      println(item)
   }
}

```
When you run the above Kotlin program, it will generate the following output:

Orange

Apple

Mango

Banana

Kotlin **while** loop executes its body continuously as long as the specified condition is **true**.

> Kotlin **while** loop is similar to Java while loop.

### Syntax

The syntax of the Kotlin **while** loop is as follows:
```

while (condition) {
    // body of the loop
}


```
When Kotlin program reaches the while loop, it checks the given **condition**, if given condition is **true** then body of the loop gets executed, otherwise program starts executing code available after the body of the while loop .

### Example

Following is an example where the while loop continue executing the body of the loop as long as the counter variable i is greater than 0:
```

fun main(args: Array<String>) {
   var i = 5;
   while (i > 0) {
      println(i)
      i--
   }
}


```
When you run the above Kotlin program, it will generate the following output:

5

4

3

2

1

Kotlin do...while Loop
----------------------

The **do..while** is similar to the while loop with a difference that the this loop will execute the code block once, before checking if the condition is true, then it will repeat the loop as long as the condition is true.

> The loop will always be executed at least once, even if the condition is false, because the code block is executed before the condition is tested.

### Syntax

The syntax of the Kotlin **do...while** loop is as follows:
```

do{
    // body of the loop
}while( condition )


```
When Kotlin program reaches the **do...while** loop, it directly enters the body of the loop and executes the available code before it checks for the given condition. If it finds given condition is true, then it repeats the execution of the loop body and continue as long as the given condition is true.

### Example

Following is an example where the do...while loop continue executing the body of the loop as long as the counter variable i is greater than 0:
```

fun main(args: Array<String>) {
   var i = 5;
   do{
      println(i)
      i--
   }while(i > 0)
}


```
When you run the above Kotlin program, it will generate the following output:

5

4

3

2

1



''';