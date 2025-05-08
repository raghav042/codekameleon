const kotlinCollections = '''
# Kotlin - Collections

Collections are a common concept for most programming languages. A collection usually contains a number of objects of the same type and Objects in a collection are called elements or items.

The Kotlin Standard Library provides a comprehensive set of tools for managing collections. The following collection types are relevant for Kotlin:

*   **Kotlin List -** List is an ordered collection with access to elements by indices. Elements can occur more than once in a list.
    
*   **Kotlin Set -** Set is a collection of unique elements which means a group of objects without repetitions.
    
*   **Kotlin Map -** Map (or dictionary) is a set of key-value pairs. Keys are unique, and each of them maps to exactly one value.
    

Kotlin Collection Types
-----------------------

Kotlin provides the following types of collection:

*   Collection or Immutable Collection
    
*   Mutable Collection

Kotlin Immutable Collection
---------------------------

Immutable Collection or simply calling a Collection interface provides read-only methods which means once a collection is created, we can not change it because there is no method available to change the object created.

### Example
```
fun main() {
    val numbers = listOf("one", "two", "three", "four")
    
    println(numbers)
}


```
When you run the above Kotlin program, it will generate the following output:

[one, two, three, four]

Kotlin Mutable Collection
-------------------------

Mutable collections provides both read and write methods.

### Example
```
fun main() {
    val numbers = mutableListOf("one", "two", "three", "four")
    
    numbers.add("five")
    
    println(numbers)
}

```
When you run the above Kotlin program, it will generate the following output:

[one, two, three, four, five]

> Note that altering a mutable collection doesn't require it to be a **var**.

## Kotlin - Lists

Kotlin list is an ordered collection of items. A Kotlin list can be either mutable (**mutableListOf**) or read-only (**listOf**). The elements of list can be accessed using indices. Kotlin mutable or immutable lists can have duplicate elements.

Creating Kotlin Lists
---------------------

For list creation, use the standard library functions **listOf()** for read-only lists and **mutableListOf()** for mutable lists.

> To prevent unwanted modifications, obtain read-only views of mutable lists by casting them to List.

### Example
```
fun main() {
    val theList = listOf("one", "two", "three", "four")
    println(theList)
    
    val theMutableList = mutableListOf("one", "two", "three", "four")
    println(theMutableList)
}
fun main() {
    val theList = listOf("one", "two", "three", "four")
    println(theList)
    
    val theMutableList = mutableListOf("one", "two", "three", "four")
    println(theMutableList)
}


```
When you run the above Kotlin program, it will generate the following output:

[one, two, three, four]

[one, two, three, four]

## Kotlin - Sets

Kotlin set is an unordered collection of items. A Kotlin set can be either mutable (**mutableSetOf**) or read-only (**setOf**). Kotlin mutable or immutable sets do not allow to have duplicate elements.

Creating Kotlin Sets
--------------------

For set creation, use the standard library functions **setOf()** for read-only sets and **mutableSetOf()** for mutable sets.

> A read-only view of a mutable set can be obtained by casting it to Set.

### Example
```
fun main() {
    val theSet = setOf("one", "two", "three", "four")
    println(theSet)
    
    val theMutableSet = mutableSetOf("one", "two", "three", "four")
    println(theMutableSet)
}

```
When you run the above Kotlin program, it will generate the following output:

[one, two, three, four]

[one, two, three, four]

## Kotlin - Maps

Kotlin map is a collection of key/value pairs, where each key is unique, and it can only be associated with one value. The same value can be associated with multiple keys though. We can declare the keys and values to be any type; there are no restrictions.

A Kotlin map can be either mutable (**mutableMapOf**) or read-only (**mapOf**).

Maps are also known as dictionaries or associative arrays in other programming languages.

Creating Kotlin Maps
--------------------

For map creation, use the standard library functions **mapOf()** for read-only maps and **mutableMapOf()** for mutable maps.

> A read-only view of a mutable map can be obtained by casting it to Map.

### Example
```
fun main() {
    val theMap = mapOf("one" to 1, "two" to 2, "three" to 3, "four" to 4)
    println(theMap)
    
    val theMutableMap = mutableSetOf("one" to 1, "two" to 2, "three" to 3, "four" to 4)
    println(theMutableMap)
}


```
When you run the above Kotlin program, it will generate the following output:

{one=1, two=2, three=3, four=4}

[(one, 1), (two, 2), (three, 3), (four, 4)]



''';