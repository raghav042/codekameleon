const function = '''
# Functions

### In Java, a method (function) can be defined by specifying the name of the method, its parameters, and its return type.

The syntax is given below.

**Syntax:**

```java
return_type method_name(parameter_list) {  
    // statement(s)  
    return value;  
}    
```
* return_type - It can be any data type such as void, int, double, etc. The return type must match the returned value of the method.
* method_name - It should be an appropriate and valid identifier.
* parameter_list - This denotes the list of parameters the method accepts.
* return value - A method returns a value after completing its execution, unless the return type is void.

## Calling a Method
### After creating a method, you can invoke the defined method within your program. The syntax is given below.

**Syntax:**

```dart
method_name(argument_list);  
// or  
variable = method_name(arguments);   
```
## Example: A Simple Method to Add Two Numbers
```java
public class Main {
    public static void main(String[] args) {
        int num1 = 10;
        int num2 = 20;
        int sum = addNumbers(num1, num2);
        System.out.println("Sum: " + sum);
    }
    
    public static int addNumbers(int num1, int num2) {
        int result = num1 + num2;
        return result;
    }
}
```
## Explanation:
* The addNumbers() method takes two integer parameters (num1 and num2).
* It adds the values of num1 and num2 and returns the result.

## Mastering methods is key to writing reusable and modular code in Java.
''';
