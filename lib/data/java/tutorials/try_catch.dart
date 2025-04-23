const try_catch = '''
# The Try-Catch Block: Catching Exceptions

### In Java, try-catch blocks are essential for handling errors (exceptions) that might occur during program execution.

### What are **Exceptions?**
* Exceptions are errors that occur during program execution. They can be caused by various factors like division by zero, accessing a non-existent file, or network issues.
* If not handled properly, exceptions can crash your program and lead to unexpected behavior.

### The syntax is given below:
**Syntax:**

```java
try {
    // Code that might throw an exception
} catch (ExceptionType e) {
    // Code for handling the exception
} 
```
## Example: Handling an Arthmetic Exception
```java
public class Main {
    public static void main(String[] args) {
        try {
            int result = 10 / 0; // This will throw an ArithmeticException
        } catch (ArithmeticException e) {
            System.out.println("Error: Division by zero is not allowed.");
        }
    }
}
```

## Explanation:
* The try block contains the code that might throw an exception (in this case, a division by zero).
* The catch block specifies how to handle the exception, in this case, by printing an error message.

## Practical Example: Handling a File Not Found Exception
```java
public class Main {
    public static void main(String[] args) {
        try {
            File file = new File("nonexistent.txt");
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                System.out.println(scanner.nextLine());
            }
        } catch (FileNotFoundException e) {
            System.out.println("Error: File not found.");
        }
    }
}
```

''';
