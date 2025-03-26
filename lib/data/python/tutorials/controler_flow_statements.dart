const pythonControlFlowStatements = '''
# Control Flow Statements in Python
Control flow statements allow us to control the execution of a program based on conditions and loops. Python provides the following control flow statements:

**1. If-Else Statements**  
**2. Match-Case (Switch-Case Alternative)**  
**3. Loops (for, while)**  
**4. Break and Continue**  

## 1. If-Else Statements-
The if-else statement executes a block of code based on a condition.

**Syntax:**
```python
if condition:
    # Code block to execute if condition is true
else:
    # Code block to execute if condition is false
```

**Example:**
```python
number = 10

if number > 0:
    print("The number is positive.")
else:
    print("The number is negative or zero.")
```
**Output:** 

```The number is positive.```

##Else-If (elif) Ladder
To check multiple conditions, use the elif statement.

```python

marks = 85

if marks >= 90:
    print("Grade: A+")
elif marks >= 75:
    print("Grade: A")
elif marks >= 50:
    print("Grade: B")
else:
    print("Fail")
```
**Output:**

>Grade: A

##2. Match-Case (Switch-Case Alternative)
Python does not have a traditional switch-case statement like other languages. However, Python 3.10 introduced the match-case statement as an alternative.

**Syntax:**
```python

match variable:
    case value1:
        # Code for value1
    case value2:
        # Code for value2
    case _:
        # Default code if no case matches
```
**Example:**

```python
day = "Monday"

match day:
    case "Monday":
        print("Start of the week.")
    case "Friday":
        print("Weekend is near.")
    case "Sunday":
        print("It's a holiday.")
    case _:
        print("It's a regular day.")
```

**Output:**


>Start of the week.

🔁 3. Loops in Python
Loops help us execute a block of code repeatedly.

✅ a) For Loop
The for loop iterates over a sequence (such as a list, tuple, string, or range).

✅ Syntax:
python
Copy
Edit
for variable in sequence:
    # Code block to execute
✅ Example:
python
Copy
Edit
for i in range(1, 6):
    print(f"Number: {i}")
🔹 Output:

javascript
Copy
Edit
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
✅ b) While Loop
The while loop continues to execute the block of code as long as the condition is true.

✅ Syntax:
python
Copy
Edit
while condition:
    # Code block to execute
✅ Example:
python
Copy
Edit
i = 1

while i <= 5:
    print(f"Number: {i}")
    i += 1
🔹 Output:

javascript
Copy
Edit
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
✅ c) Nested Loop
A nested loop is a loop inside another loop.

python
Copy
Edit
for i in range(1, 4):
    for j in range(1, 3):
        print(f"i = {i}, j = {j}")
🔹 Output:

ini
Copy
Edit
i = 1, j = 1
i = 1, j = 2
i = 2, j = 1
i = 2, j = 2
i = 3, j = 1
i = 3, j = 2
⏹️ 4. Break and Continue
✅ Break Statement
The break statement exits the loop immediately, regardless of the condition.

✅ Example:
python
Copy
Edit
for i in range(1, 10):
    if i == 5:
        break
    print(f"Number: {i}")
🔹 Output:

javascript
Copy
Edit
Number: 1
Number: 2
Number: 3
Number: 4
✅ Continue Statement
The continue statement skips the current iteration and moves to the next one.

✅ Example:
python
Copy
Edit
for i in range(1, 6):
    if i == 3:
        continue
    print(f"Number: {i}")
🔹 Output:

javascript
Copy
Edit
Number: 1
Number: 2
Number: 4
Number: 5
📚 Summary Table
Statement	Description
If-Else	Executes a block of code based on a condition.
Match-Case	Matches a value to multiple cases (Python 3.10+).
For Loop	Iterates over a sequence (list, tuple, etc.).
While Loop	Executes as long as the condition is true.
Break	Terminates the loop immediately.
Continue	Skips the current iteration and continues.
🎉 Final Example: Putting It All Together
python
Copy
Edit
marks = 85

# If-Else Example
if marks >= 90:
    grade = "A+"
elif marks >= 75:
    grade = "A"
else:
    grade = "B"

# Match-Case Example
match grade:
    case "A+":
        print("Excellent!")
    case "A":
        print("Very Good!")
    case _:
        print("Good effort!")

# For Loop Example
for i in range(1, 6):
    if i == 3:
        continue
    if i == 5:
        break
    print(f"Number: {i}")
🔹 Output:

javascript
Copy
Edit
Very Good!
Number: 1
Number: 2
Number: 4
Now you have a solid understanding of Control Flow Statements in Python! 🚀
''';
