const if_else = '''
# If-Else

### If-else statements are fundamental for decision-making in your code. They allow you to execute different code sections based on whether a specific condition is true or false. The decision-making process in programming is crucial for controlling the flow of execution.

### How does it work?

**Syntax:**

```javascript
if (condition) {
  // Code to be executed if the condition is true
} else {
  // Code to be executed if the condition is false (optional)
}

```
### Example:

```javascript
let age = 25;
if (age >= 18) {
  console.log("You are eligible to vote.");
} else {
  console.log("You are not eligible to vote.");
}

```
* The variable age holds the value 25.
* The if statement checks if age is greater than or equal to 18 (voting age).
* Since age is 25, which satisfies the condition, the code within the first curly braces (print("You are eligible   to vote.")) gets executed.

### Nested If-Else
If you need to check multiple conditions, you can nest if-else statements:
```javascript
let age = 18;
if (age >= 18) {
  if (age >= 21) {
    console.log("You are an adult and can legally drink alcohol.");
  } else {
    console.log("You are an adult but cannot legally drink alcohol.");
  }
} else {
  console.log("You are not an adult.");
}
```
### Summary:
* The if-else statement allows you to handle decision-making processes in your code.
* You can control what happens based on whether a condition is true or false.
* It's an essential tool for handling logic in your programs.

''';
