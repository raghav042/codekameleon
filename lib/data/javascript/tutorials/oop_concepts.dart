const oop_concepts = '''
# Object-Oriented Programming (OOP) Concepts in JavaScript

### Object-Oriented Programming (OOP) is a programming paradigm that uses objects and classes to organize code and solve problems. In JavaScript, OOP is implemented through the use of **classes**, **objects**, **inheritance**, **encapsulation**, **polymorphism**, and **abstraction**.

## Key OOP Concepts:

### 1. **Classes and Objects**

- **Class**: A class is a blueprint for creating objects (instances). It defines the properties and methods that the objects of that class will have.
- **Object**: An object is an instance of a class. It holds data (properties) and can perform actions (methods).

**Syntax for Classes:**
```javascript
class ClassName {
  constructor(property1, property2) {
    this.property1 = property1;
    this.property2 = property2;
  }

  methodName() {
    // Code to be executed
  }
}
```
### Example: Class and Object
```javascript
class Car {
  constructor(make, model) {
    this.make = make;
    this.model = model;
  }

  startEngine() {
    console.log("The engine is starting.");
  }
}

const myCar = new Car("Toyota", "Corolla");
console.log(myCar.make); // Output: Toyota
myCar.startEngine(); // Output: The engine is starting.
```


''';
