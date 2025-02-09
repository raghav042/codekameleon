const classes_objects = '''## Classes And Objects

### In Dart, classes are like blueprints for creating objects. They define the properties (data) and behaviors (functions).


**Syntax:**

```dart
class ClassName {  
   <fields>  
   <constructor>  
   <functions>  
}   
```
## Example: A Simple Car Class
```dart
class Car {
  // Properties 
  String color;
  String model;
  int year;

  // Methods (functions)
  void startEngine() {
    print("The engine is starting!");
  }

  void accelerate() {
    print("The car is speeding up!");
  }
}
```
## Creating Class Objects in Dart
### After creating the class, we can create an instance or object of that class which we want to access its fields and functions. The new keyword is used to declare class followed by the class name.

**Syntax:**

```dart
var object_name  = new class_name();    
```
* Each object holds its own set of values for the properties defined in its class. For example, a Car object might have a color property set to "red" and another Car object might have it set to "blue."
* Objects can call the methods defined in their class. These methods operate on the object's own data.
''';
