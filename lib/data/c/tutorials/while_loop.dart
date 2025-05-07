const while_loop = '''
# While Loop in C

### While loops are used for automating repetitive tasks within your code. They allow you to execute a block of code multiple times, as long as a specific condition remains true. This saves you time and effort compared to manually writing the code repeatedly.

---

## **Syntax:**

```C
while (condition) {
    // statement(s);
    // Increment (++) or Decrement (--) Operation;
}
```

### Example: COunting from 1 to 5

```C
#include <stdio.h>

int main() {
    int i = 1;

    while (i <= 5) {
        printf("%d\n", i);
        i++; // Increment i by 1 in each iteration
    }

    return 0;
}
```

### Explanation:
* The while loop continues to execute the statements inside the block as long as the condition is true.
* In the example, the loop prints numbers from 1 to 5, incrementing i after each iteration.
* Once i exceeds 5, the condition (i <= 5) becomes false, and the loop terminates.
''';