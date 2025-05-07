const if_else = '''
# If-Else in C

### The `if-else` statement is a fundamental control structure in C. It allows you to execute different blocks of code based on whether a condition evaluates to `true` or `false`.

---

## 🔹 Syntax:

```C
if (condition) {
    // Code to execute if condition is true
} else {
    // Code to execute if condition is false
}
```

### Example:
```C
#include <stdio.h>

int main() {
    int age = 25;

    if (age >= 18) {
        printf("You are eligible to vote.\\n");
    } else {
        printf("You are not eligible to vote.\\n");
    }

    return 0;
}
```

### Explanation:
* The variable age holds the value 25.
* The if statement checks whether age >= 18.
* Since 25 >= 18 is true, the first block runs:
printf("You are eligible to vote.");
* If the condition was false, the else block would have been executed instead.

### Use Case:
Use if-else when you want to make a binary decision — either this or that, true or false, yes or no.

''';