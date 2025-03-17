const pythonVariablesAndDataTpes = '''
# Python Variables and Data Types
In Python, variables are used to store data, and different types of data can be stored in them. Let's explore declaring variables, primitive data types, and type conversion in Python.

## Declaring Variables- 
A variable in Python is created as soon as you assign a value to it. Unlike other programming languages, you don’t need to declare the data type explicitly—Python determines it automatically.

Example:

```python

# Declaring variables
name = "Alice"  # String
age = 25        # Integer
height = 5.7    # Float
is_student = True  # Boolean

print(name, age, height, is_student)
```
**Rules for Naming Variables**:
- Can contain letters (a-z, A-Z), digits (0-9), and underscores (_).
- Cannot start with a number.
- Case-sensitive (name and Name are different).
- Cannot use Python keywords (like if, else, while, etc.).

##  Primitive Data Types
Python has four main primitive data types:

-Data Type	Example	Description
- int	age = 25	Stores whole numbers
- float	height = 5.7	Stores decimal numbers
- str	name = "Alice"	Stores text (characters inside quotes)
- bool	is_student = True	Stores True or False
Example:

```python

# Integer
age = 25
print(type(age))  # Output: <class 'int'>

# Float
height = 5.7
print(type(height))  # Output: <class 'float'>

# String
name = "Alice"
print(type(name))  # Output: <class 'str'>

# Boolean
is_student = True
print(type(is_student))  # Output: <class 'bool'>
```
##3. Type Conversion
You can convert one data type to another using built-in functions:

- int() → Converts to an integer
- float() → Converts to a float
- str() → Converts to a string
Example:

```python

# Converting float to int
num = 5.9
new_num = int(num)  # Removes decimal part
print(new_num)  # Output: 5

# Converting int to float
age = 25
new_age = float(age)
print(new_age)  # Output: 25.0

# Converting int to string
score = 90
score_str = str(score)
print(score_str)  # Output: '90'

# Converting string to int
num_str = "100"
num_int = int(num_str)
print(num_int)  # Output: 100
```
## Summary-
- Variables store data without explicitly declaring types.
- Primitive data types: int, float, str, and bool.
- Type conversion: Use int(), float(), and str() to change data types.

Now that you understand variables and data types, let's explore operators and expressions next! 

Let me know if you need any modifications! 
''';