## The Try-Catch Block: Catching Exceptions

### In Dart, try-catch blocks are essential for handling errors (exceptions) that might occur during program execution. 
What are **Exceptions?**
* Exceptions are errors that arise during program execution. They can be caused by various factors like division by zero, accessing a non-existent file, or network issues.
* If not handled properly, exceptions can crash your program, leading to unexpected behavior.

The syntax is given below.
**Syntax:**

```dart
try {
// code that might throw an exception
}
on Exception1 {
// Specify the exception
}
Catch Exception2 {
// code for handling exception
}  
```

* **Try Block:** This block contains the code that might potentially throw an exception.
* **Catch Block:** This block defines how to handle the exception if it occurs within the try block.