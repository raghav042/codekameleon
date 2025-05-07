const while_loop = '''
# While Loop

### While loops are used for automating repetitive tasks within your code. They allow you to execute a block of code multiple times, as long as a specific condition remains true. This saves you time and effort compared to manually writing the code repeatedly.

**Syntax:**

```javascript
while (condition) {
  // statement(s);
  // Increment (++) or Decrement (--) Operation;
}
```

### Key Points:
* Condition: The condition is evaluated before each iteration of the loop. As long as the condition is true, the loop will continue executing. If the condition is false, the loop will stop.
* Body of the Loop: The statements inside the loop body are executed repeatedly as long as the condition remains true.
* Increment/Decrement: Typically, you modify a variable within the loop (using increment ++ or decrement --) to eventually make the condition false, thereby ending the loop. This is crucial to avoid an infinite loop.

```javascript
let i = 0;

while (i < 5) {
  console.log(i);  // Prints the current value of i
  i++;            // Increment i by 1 after each loop
}
```

### Infinite Loop Warning:
If the condition in the while loop never becomes false, the loop will run infinitely, which can cause your program to freeze or crash. To avoid this, ensure that the loop condition eventually evaluates to false.

***Example of an Infinite Loop (Avoid This!)***:
```javascript
let i = 0;

while (i < 5) {
  console.log(i);  // This will keep printing 0 forever because i is never incremented.
}
```
##### Using while loops effectively allows you to automate repetitive tasks and reduce the need for redundant code in JavaScript.
''';
