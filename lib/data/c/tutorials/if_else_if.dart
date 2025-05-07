const if_else_if = '''
# If Else-If in C

### The `if else-if` ladder allows you to execute different blocks of code based on multiple conditions. It is used when there are **more than two possibilities** and only **one condition needs to be true**.

---

## 🔹 Syntax

```c
if (condition1) {
    // statements for condition1
}
else if (condition2) {
    // statements for condition2
}
else if (conditionN) {
    // statements for conditionN
}
else {
    // statements if none of the above conditions are true
}

### Key Points
* Conditions are evaluated from top to bottom.
* As soon as one if or else if condition evaluates to true, the corresponding block is executed, and the rest are skipped.
* The final else is optional but useful for a fallback/default case.

### Example

```C
#include <stdio.h>

int main() {
    int marks = 85;

    if (marks >= 90) {
        printf("Grade: A\\n");
    }
    else if (marks >= 80) {
        printf("Grade: B\\n");
    }
    else if (marks >= 70) {
        printf("Grade: C\\n");
    }
    else {
        printf("Grade: F\\n");
    }

    return 0;
}
```

### When to Use if else-if Ladder
* When there are mutually exclusive options.
* When you want to implement range-based decisions (like grading, score classification).
* When the number of conditions is not large (for large fixed sets, use switch instead).

''';