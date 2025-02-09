const if_else = '''## If-Else

### If else statements are fundamental for decision-making in your code. They allow you to execute different code sections based on whether a specific condition is true or false.


**Syntax:**

```dart
if (condition) {
  // Code to be executed if the condition is true
} else {
  // Code to be executed if the condition is false (optional)
}
```

```dart
int age = 25;
if (age >= 18) {
  print("You are eligible to vote.");
} else {
  print("You are not eligible to vote.");
}
```
* The variable age holds the value 25.
* The if statement checks if age is greater than or equal to 18 (voting age).
* Since age is 25, which satisfies the condition, the code within the first curly braces (print("You are eligible   to vote.")) gets executed.
''';