const constructor = '''# Constructors in C?

### C does **not** support constructors like object-oriented languages such as C++ or Dart. However, we can simulate constructor behavior using functions that initialize `struct` objects. These initialization functions are manually called after creating the struct.

The idea is to define a function that sets up the fields of a structure when you create an instance of it.

**Syntax:**

```c
#include <stdio.h>
#include <string.h>

struct ClassName {
    int field1;
    char field2[20];
};

// Simulated constructor function
void initClassName(struct ClassName *obj, int f1, const char *f2) {
    obj->field1 = f1;
    strcpy(obj->field2, f2);
}
* The function initClassName acts like a constructor.
* It takes a pointer to the struct and sets up its initial state.
* In C, this kind of manual setup is common practice for initialization.
''';
