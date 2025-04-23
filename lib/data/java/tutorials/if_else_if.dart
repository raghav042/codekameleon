const if_else_if = '''
# If Else-If

### The if else-if statement executes different blocks of code. It is used when you need to make a decision from more than two possibilities.

**Syntax:**

```java
if (condition1) {  
    // statement(s)  
}  
else if (condition2) {  
    // statement(s)  
}  
else if (conditionN) {  
    // statement(s)  
}  
...  
else {  
    // statement(s)  
}  
```
### The structure described above is also known as an else-if ladder. It's a powerful tool for making multiple decisions within your code.

## Example: Grade Evaluation
```java
public class Main {
    public static void main(String[] args) {
        int score = 85;

        if (score >= 90) {
            System.out.println("Grade: A");
        } else if (score >= 80) {
            System.out.println("Grade: B");
        } else if (score >= 70) {
            System.out.println("Grade: C");
        } else if (score >= 60) {
            System.out.println("Grade: D");
        } else {
            System.out.println("Grade: F");
        }
    }
}
```

## Explanation:
* The variable score holds the value 85.
* The if statement checks if score is greater than or equal to 90.
* Since score is 85, which does not satisfy the condition, the code within the first curly braces (System.out.println("Grade: A");) does not get executed.
* The else if statement checks if score is greater than or equal to 80.
* Since score is 85, which does not satisfy the condition, the code within the second curly braces (System.out.println("Grade: B");) does not get executed.
* The else if statement checks if score is greater than or equal to 70.
* Since score is 85, which does not satisfy the condition, the code within the third curly braces (System.out.println("Grade: C");) does not get executed.
* The else if statement checks if score is greater than or equal to 60.
* Since score is 85, which does not satisfy the condition, the code within the fourth curly braces (System.out.println("Grade: D");) does not get executed.
* The else block executes, and the code within it (System.out.println("Grade: F");) gets executed.

## Mastering the else-if ladder allows for effective handling of multiple decision-making scenarios in your code.
''';
