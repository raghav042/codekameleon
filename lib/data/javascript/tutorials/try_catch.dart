const try_catch = '''
# The Try-Catch Block: Catching Exceptions

### In JavaScript, try-catch blocks are essential for handling errors (exceptions) that might occur during program execution.
What are **Exceptions**?
* Exceptions are errors that arise during program execution. They can be caused by various factors, such as division by zero, accessing a non-existent file, or network issues.
* If not handled properly, exceptions can crash your program, leading to unexpected behavior.

The syntax is given below:

**Syntax:**

```javascript
try {
  // Code that might throw an exception
} catch (error) {
  // Code to handle the exception
} finally {
  // Code that will run regardless of whether an exception occurred or not
} 
```

* Try Block: This block contains the code that might potentially throw an exception. Any error that occurs inside this block will be caught by the catch block.
* Catch Block: This block defines how to handle the exception if it occurs within the try block. The catch block receives the exception (usually an error object) that was thrown.
* Finally Block: This block is optional, and the code within it will always execute, whether an exception occurred or not. It's often used for clean-up actions like closing files, releasing resources, or resetting application state.

### Example:
```javascript
function divide(a, b) {
  try {
    if (b === 0) {
      throw new Error("Cannot divide by zero!");
    }
    let result = a / b;
    console.log("Result: " + result);
  } catch (error) {
    console.log("Error: " + error.message);  // Handle the exception
  } finally {
    console.log("Division attempt finished.");  // Always executed
  }
}

divide(10, 0);  // Output: Error: Cannot divide by zero! 
                // Division attempt finished.

divide(10, 2);  // Output: Result: 5
                // Division attempt finished.
```

### Key Points:
* Try Block: Used to enclose code that may throw an exception.
* Catch Block: Catches the error if an exception occurs and allows you to handle it.
* Finally Block: Always executed, useful for clean-up tasks.

##### Using try-catch helps in building more robust, error-resilient programs in JavaScript.
''';
