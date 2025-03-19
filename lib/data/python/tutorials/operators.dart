const pythonOperators = '''
# Python Operators
Operators in Python are symbols that perform operations on variables and values. Python supports various types of operators, including arithmetic, comparison, logical, assignment, bitwise, membership, and identity operators.

**1. Arithmetic Operators**
Arithmetic operators are used for mathematical operations like addition, subtraction, multiplication, etc.

```python

# Arithmetic Operators in Python
a = 10
b = 3

print(a + b)  # Addition: 10 + 3 = 13
print(a - b)  # Subtraction: 10 - 3 = 7
print(a * b)  # Multiplication: 10 * 3 = 30
print(a / b)  # Division: 10 / 3 = 3.3333
print(a % b)  # Modulus: 10 % 3 = 1 (remainder)
print(a // b) # Floor Division: 10 // 3 = 3 (quotient)
print(a ** b) # Exponentiation: 10^3 = 1000
```

**2. Comparison Operators**
Comparison operators compare values and return True or False.

```python

# Comparison Operators in Python
x = 5
y = 10

print(x == y)  # False: 5 is not equal to 10
print(x != y)  # True: 5 is not equal to 10
print(x > y)   # False: 5 is not greater than 10
print(x < y)   # True: 5 is less than 10
print(x >= y)  # False: 5 is not greater than or equal to 10
print(x <= y)  # True: 5 is less than or equal to 10
```

**3. Logical Operators**
Logical operators (and, or, not) are used for combining conditional statements.

```python

# Logical Operators in Python
a = True
b = False

print(a and b)  # False: Both need to be True
print(a or b)   # True: At least one is True
print(not a)    # False: Not of True is False
```

**4. Assignment Operators**
Assignment operators are used to assign values to variables and modify them.

```python

# Assignment Operators in Python
x = 5
x += 3  # Equivalent to x = x + 3
print(x)  # Output: 8

x -= 2  # Equivalent to x = x - 2
print(x)  # Output: 6

x *= 2  # Equivalent to x = x * 2
print(x)  # Output: 12

x /= 3  # Equivalent to x = x / 3
print(x)  # Output: 4.0

x //= 2  # Equivalent to x = x // 2
print(x)  # Output: 2.0

x %= 2  # Equivalent to x = x % 2
print(x)  # Output: 0.0
```

**5. Bitwise Operators**
Bitwise operators perform operations at the bit level.

```python

# Bitwise Operators in Python
a = 5  # 0b0101
b = 3  # 0b0011

print(a & b)  # Bitwise AND: 0101 & 0011 = 0001 (1)
print(a | b)  # Bitwise OR:  0101 | 0011 = 0111 (7)
print(a ^ b)  # Bitwise XOR: 0101 ^ 0011 = 0110 (6)
print(~a)     # Bitwise NOT: ~0101 = -6
print(a << 1) # Left Shift: 0101 << 1 = 1010 (10)
print(a >> 1) # Right Shift: 0101 >> 1 = 0010 (2)
```
**6. Membership Operators**
Membership operators check if a value exists in a sequence (list, tuple, string, etc.).

```python

# Membership Operators in Python
my_list = [1, 2, 3, 4, 5]

print(3 in my_list)  # True: 3 is in the list
print(10 not in my_list)  # True: 10 is not in the list 
```

**7. Identity Operators**
Identity operators compare the memory location of two objects.

```python

# Identity Operators in Python
a = [1, 2, 3]
b = a
c = [1, 2, 3]

print(a is b)  # True: b is the same object as a
print(a is c)  # False: c has the same content but is a different object
print(a is not c)  # True: a and c are different objects
```
''';
