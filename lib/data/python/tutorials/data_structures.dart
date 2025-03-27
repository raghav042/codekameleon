const pythonDataStructures = '''
# Data Structures in Python
Data structures help store, organize, and manipulate data efficiently. Python provides several built-in data structures that allow developers to perform operations effectively.

## 1. Lists (`list`)
A list is an **ordered, mutable** collection of items that can hold elements of different types.

### **Creating a List**
A list is created using square brackets `[]` or by using the `list()` constructor.

**Example:**
```python
# Creating lists
fruits = ["Apple", "Banana", "Cherry"]
numbers = [1, 2, 3, 4, 5]
mixed_list = [1, "Hello", 3.5, True]

# Using list() constructor
empty_list = list()
```

### **Accessing List Elements**
List elements can be accessed using indexing and slicing.

**Example:**
```python
fruits = ["Apple", "Banana", "Cherry"]

# Indexing
print(fruits[0])  # Output: Apple
print(fruits[-1])  # Output: Cherry

# Slicing
print(fruits[1:3])  # Output: ['Banana', 'Cherry']
```

### **Modifying a List**
Lists are mutable, meaning their contents can be changed.

**Example:**
```python
fruits = ["Apple", "Banana", "Cherry"]

# Modifying an element
fruits[1] = "Mango"

# Adding an element
fruits.append("Orange")

# Inserting at a specific index
fruits.insert(1, "Grapes")

# Removing an element
fruits.remove("Cherry")

print(fruits)  # Output: ['Apple', 'Grapes', 'Mango', 'Orange']
```

### **List Methods in Python**

| **Method**    | **Description**                            |
|---------------|--------------------------------------------|
| `append()`    | Adds an element at the end                 |
| `insert()`    | Inserts an element at a specific index     |
| `remove()`    | Removes the first occurrence of an item    |
| `pop()`       | Removes and returns an item by index       |
| `sort()`      | Sorts the list                             |
| `reverse()`   | Reverses the order of items                |


## 2. Tuples (tuple)
A tuple is an ordered, immutable collection of items. Once created, the items of a tuple cannot be modified.

### **Creating a Tuple**
Tuples are created using parentheses () or the tuple() constructor.

**Example:**
```python
# Creating tuples
fruits = ("Apple", "Banana", "Cherry")
numbers = (1, 2, 3, 4, 5)
mixed_tuple = (1, "Hello", 3.5, True)

# Using tuple() constructor
empty_tuple = tuple()
```

### **Accessing Tuple Elements**
Tuples support indexing and slicing like lists.

**Example:**
```python
fruits = ("Apple", "Banana", "Cherry")

# Indexing
print(fruits[0])  # Output: Apple
print(fruits[-1])  # Output: Cherry

# Slicing
print(fruits[1:3])  # Output: ('Banana', 'Cherry')
```

### Tuple Operations
Since tuples are immutable, they do not support modification, but we can concatenate or multiply them.

**Example:**
```python
# Concatenating tuples
tuple1 = (1, 2, 3)
tuple2 = (4, 5, 6)
result = tuple1 + tuple2
print(result)  # Output: (1, 2, 3, 4, 5, 6)

# Multiplying tuples
repeated = tuple1 * 2
print(repeated)  # Output: (1, 2, 3, 1, 2, 3)
```

### **Tuple Methods in Python**

| **Method**    | **Description**                          |
|---------------|------------------------------------------|
| `count()`     | Returns the count of a specific item     |
| `index()`     | Returns the index of an item             |


## 3. Sets (set)
A set is an unordered, mutable collection of unique items. Sets automatically remove duplicates.

### **Creating a Set**
Sets are created using curly braces {} or the set() constructor.

**Example:**
```python
# Creating sets
fruits = {"Apple", "Banana", "Cherry"}
numbers = {1, 2, 3, 4, 5}

# Using set() constructor
empty_set = set()
```

### **Adding and Removing Items**
Items can be added using add() and removed using remove() or discard().

**Example:**
```python
fruits = {"Apple", "Banana", "Cherry"}

# Adding elements
fruits.add("Orange")

# Removing elements
fruits.remove("Banana")
fruits.discard("Cherry")

print(fruits)  # Output: {'Apple', 'Orange'}
```

### **Set Operations**
Sets support operations like union, intersection, and difference.

**Example:**

```python
Copy
Edit
set1 = {1, 2, 3, 4}
set2 = {3, 4, 5, 6}

# Union
print(set1 | set2)  # Output: {1, 2, 3, 4, 5, 6}

# Intersection
print(set1 & set2)  # Output: {3, 4}

# Difference
print(set1 - set2)  # Output: {1, 2}
```
### **Set Methods in Python**

| **Method**       | **Description**                                     |
|------------------|-----------------------------------------------------|
| `add()`          | Adds an element to the set                          |
| `remove()`       | Removes an element (throws error if not found)      |
| `discard()`      | Removes an element (no error if not found)          |
| `union()`        | Returns the union of sets                           |
| `intersection()` | Returns the intersection of sets                   |
| `difference()`   | Returns the difference between sets                 |


## 4. Dictionaries (dict)
A dictionary is an unordered, mutable collection that stores data in key-value pairs.

### **Creating a Dictionary**
Dictionaries are created using curly braces {} or the dict() constructor.
**Example:**
```python
# Creating dictionaries
person = {"name": "Abhay", "age": 20, "city": "Jalandhar"}
empty_dict = dict()

# Using dict() constructor
person2 = dict(name="Kunal", age=21, city="Delhi")
```

### **Accessing and Modifying Dictionary Items**
Items can be accessed using keys and modified easily.
**Example:**
```python
person = {"name": "Abhay", "age": 20, "city": "Jalandhar"}

# Accessing values
print(person["name"])  # Output: Abhay

# Modifying values
person["age"] = 21

# Adding a new key-value pair
person["hobby"] = "Reading"

# Removing a key-value pair
del person["city"]

print(person)  # Output: {'name': 'Abhay', 'age': 21, 'hobby': 'Reading'}
```

### **Dictionary Methods in Python**

| **Method**    | **Description**                                 |
|---------------|-------------------------------------------------|
| `keys()`      | Returns all keys                                |
| `values()`    | Returns all values                              |
| `items()`     | Returns key-value pairs                         |
| `get()`       | Returns a value for a key                       |
| `pop()`       | Removes a key and returns its value             |
| `update()`    | Updates the dictionary with key-value pairs     |


## 5. List Comprehension
List comprehension is a concise and efficient way to create lists from existing iterables.

### Basic List Comprehension
**Syntax:**
```python

[expression for item in iterable if condition]
```
**Example:**
```python

# Creating a list of squares
squares = [x ** 2 for x in range(5)]
print(squares)  # Output: [0, 1, 4, 9, 16]

# Filtering even numbers
even_numbers = [x for x in range(10) if x % 2 == 0]
print(even_numbers)  # Output: [0, 2, 4, 6, 8]
```
''';
