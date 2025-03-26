const pythonLoops = '''
# Loops in Python
Loops allow us to execute a block of code repeatedly as long as a condition is true or until a sequence is exhausted. Python provides the following types of loops:

**1. For Loop**  
**2. While Loop**  
**3. Break and Continue Statements** 
**4. Nested Loops in Python**

## 1. For Loop
The `for` loop iterates over a sequence (such as a list, tuple, string, or range) and executes a block of code.

**Syntax:**
```python
for variable in sequence:
    # Code block to execute
```
**Example:**

```python
fruits = ["apple", "banana", "cherry"]

for fruit in fruits:
    print(f"Fruit: {fruit}")
```

**Output**
>Fruit: apple  
>Fruit: banana  
>Fruit: cherry\n

## Using range() with For Loop:
```python

for i in range(1, 6):
    print(f"Number: {i}")
```

**Output:**

>Number: 1  
>Number: 2  
>Number: 3  
>Number: 4  
>Number: 5\n

## 2. While Loop
The while loop executes a block of code as long as a specified condition remains true.
**Syntax:**
```python
while condition:
    # Code block to execute
```

**Example:**
```python
count = 1

while count <= 5:
    print(f"Count: {count}")
    count += 1
```

**Output:**

>Count: 1  
>Count: 2  
>Count: 3  
>Count: 4  
>Count: 5

## 3. Nested Loops\n
A loop inside another loop is called a nested loop. It is used to iterate over complex data structures.

**Example:**
```python
for i in range(1, 3):
    for j in range(1, 4):
        print(f"i = {i}, j = {j}")
```
**Output:**

>i = 1, j = 1  
>i = 1, j = 2  
>i = 1, j = 3  
>i = 2, j = 1  
>i = 2, j = 2  
>i = 2, j = 3


\n## 4. Break and Continue Statements
Break and Continue allow us to alter the control flow of a loop.

### **Break Statement:**
The break statement terminates the loop immediately when encountered.

**Example:**
```python
for i in range(1, 10):
    if i == 5:
        break
    print(f"Number: {i}")
```

**Output:**

>Number: 1  
>Number: 2  
>Number: 3  
>Number: 4\n

### **Continue Statement:**
The continue statement skips the current iteration and moves to the next iteration.

**Example:**
```python
for i in range(1, 6):
    if i == 3:
        continue
    print(f"Number: {i}")
```
**Output:**

>Number: 1  
>Number: 2  
>Number: 4  
>Number: 5

## Nested Loops in Python
A nested loop is a loop inside another loop. It allows us to iterate over a sequence within another sequence. The inner loop executes completely for each iteration of the outer loop.

**Syntax:**
```python
for outer_variable in outer_sequence:
    for inner_variable in inner_sequence:
        # Code block to execute
```

**Example:**
```python

for i in range(1, 4):
    for j in range(1, 3):
        print(f"i = {i}, j = {j}")
```

**Output:**

>i = 1, j = 1  
>i = 1, j = 2  
>i = 2, j = 1  
>i = 2, j = 2  
>i = 3, j = 1 

''';
