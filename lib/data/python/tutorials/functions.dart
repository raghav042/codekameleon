const pythonFunctions = '''
# Functions in Python
Functions are reusable blocks of code that perform a specific task. They help in making the code modular, maintainable, and easier to understand.


## 1. Defining Functions
A function is defined using the `def` keyword followed by the function name and parentheses.

**Syntax:**
```python
def function_name(parameters):
    # Code block to execute
    return result  # (optional)
```

**Example:**
```python

def greet(name):
    print(f"Hello, {name}!")
    
greet("Abhay")
```

**Output:**
>Hello, Abhay!

## 2. Function Arguments
Functions can accept arguments to pass data into them. There are 5 types of function arguments:\n

- Positional Arguments

- Keyword Arguments

- Default Arguments

- Arbitrary Arguments (*args)

- Arbitrary Keyword Arguments (**kwargs)

## 2.1. Positional Arguments
Positional arguments are passed in the same order as the parameters.

**Example:**

```python
def info(name, age):
    print(f"Name: {name}, Age: {age}")
    
info("Abhay", 20)
```
**Output:**
>Name: Abhay, Age: 20

## 2.2. Keyword Arguments
Keyword arguments are passed by specifying parameter names.

**Example:**

```python
def info(name, age):
    print(f"Name: {name}, Age: {age}")
    
info(age=20, name="Abhay")
```

**Output:**

>Name: Abhay, Age: 20

## 2.3. Default Arguments
Default arguments take a default value if no value is passed.

**Example:**

```python
def greet(name="Guest"):
    print(f"Hello, {name}!")
    
greet()
greet("Abhay")
```

**Output:**

>Hello, Guest!  
>Hello, Abhay!

## 2.4. Arbitrary Arguments (*args)
When the number of arguments is unknown, use *args to pass a variable number of positional arguments.

**Example:**

```python
def display_items(*items):
    for item in items:
        print(item)
        
display_items("Apple", "Banana", "Cherry")
```
**Output:**
>Apple  
>Banana  
>Cherry

## 2.5. Arbitrary Keyword Arguments (**kwargs)
When the number of keyword arguments is unknown, use **kwargs to pass variable-length named arguments.

**Example:**

```python
def display_info(**info):
    for key, value in info.items():
        print(f"{key}: {value}")
        
display_info(name="Abhay", age=20, city="Jalandhar")
```
**Output:**

>name: Abhay  
>age: 20  
>city: Jalandhar

## 3. Return Statement
The return statement is used to send a value back from a function.

**Example:**

```python
def add(a, b):
    return a + b

result = add(5, 10)
print(f"Sum: {result}")
```

**Output:**
>Sum: 15

## 4. Lambda Functions (Anonymous Functions)
A lambda function is a small anonymous function that can have only one expression.

**Syntax:**
```python
lambda arguments: expression
```
**Example:**

```python
square = lambda x: x ** 2
print(square(5))
```
**Output:**
>25

**Example with Multiple Arguments:**

```python
add = lambda a, b: a + b
print(add(5, 10))
```

**Output:**
>15

## 5. Using Functions in a Loop
We can call functions inside a loop to perform repeated tasks.

**Example:**

```python

def square(n):
    return n * n

for i in range(1, 6):
    print(f"Square of {i}: {square(i)}")
```

**Output:**

>Square of 1: 1  
>Square of 2: 4  
>Square of 3: 9  
>Square of 4: 16  
>Square of 5: 25
''';
