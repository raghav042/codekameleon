const while_loop = '''
# While Loop

### While loops are used for automating repetitive tasks within your code. They allow you to execute a block of code multiple times, as long as a specific condition remains true. This saves you time and effort compared to manually writing the code repeatedly.

**Syntax:**

```java
while (condition) {  
    // statement(s);  
    // Increment (++) or Decrement (--) Operation (if needed);  
}   
   
```
## Example: Using a While Loop

```java
public class Main {
    public static void main(String[] args) {
        int count = 0;

        while (count < 5) {
            System.out.println("Count is: " + count);
            count++; // Increment operation
        }
    }
}
```
## Explanation:
* The variable count starts at 0.
* The while loop checks if count is less than 5. If it is, the code within the loop is executed.
* The code within the loop is executed once, then the value of count is incremented by 1.
* The while loop repeats this process until count is greater than or equal to 5, at which point the loop ends.


## Infinite Loop:

```java:
while (true) {
    System.out.println("This will run forever!");
}
```
## Explanation:
* The while loop is an infinite loop, which means it will run indefinitely.
* The condition within the loop is always true, so the code within the loop will continue to execute.

## Nested Loops:

```java
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        System.out.println("i = " + i + ", j = " + j);
    }
}
```
## Explanation:
* The outer loop runs from 1 to 3, and the inner loop runs from 1 to 3 for each iteration of the outer loop.
* The code within the inner loop is executed once for each iteration of the outer loop.
* The output will be:

i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 2, j = 2
i = 2, j = 3
i = 3, j = 1
i = 3, j = 2
i = 3, j = 3

''';
