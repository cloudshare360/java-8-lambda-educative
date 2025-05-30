Here’s a detailed breakdown of **`Comparable`** and **`Comparator`** in Java, including their differences and when to use them:

---

### **Key Differences**

| Feature                | `Comparable`                              | `Comparator`                              |
|------------------------|-------------------------------------------|-------------------------------------------|
| **Purpose**            | Defines the **natural ordering** of a class. | Defines **custom sorting logic** externally. |
| **Package**            | `java.lang`                               | `java.util`                               |
| **Method to Override** | `int compareTo(T o)`                      | `int compare(T o1, T o2)`                 |
| **Modification Required** | Requires modifying the class itself.     | No need to modify the class.              |
| **Flexibility**        | Fixed natural ordering.                   | Multiple sorting strategies possible.     |
| **Default Sorting**    | Used by default in `Collections.sort()` and `Arrays.sort()`. | Must explicitly pass a `Comparator` to sorting methods. |
| **Java 8+ Enhancements** | No new methods (part of `java.lang`).     | Rich helper methods like `comparing()`, `thenComparing()`, `reversed()`. |

---

### **When to Use `Comparable`**
Use `Comparable` when:
- The class has a **natural, unambiguous ordering** (e.g., `String`, `Integer`, `Date`).
- You want to sort instances of the class **without extra configuration**.
- You **own or can modify** the class.

**Example**: Sorting a list of `Person` objects by age naturally.
```java
public class Person implements Comparable<Person> {
    private int age;

    @Override
    public int compareTo(Person other) {
        return this.age - other.age; // Natural ordering by age
    }
}

// Usage
List<Person> people = ...;
Collections.sort(people); // Uses natural ordering
```

---

### **When to Use `Comparator`**
Use `Comparator` when:
- You need **multiple sorting criteria** (e.g., sort `Person` by name, salary, or department).
- You **cannot modify the class** (e.g., third-party classes like `String` or legacy code).
- You want to **decouple sorting logic** from the class.
- You need **dynamic or conditional sorting**.

**Example**: Sorting `Person` objects by name or salary.
```java
public class Person {
    private String name;
    private double salary;

    // Constructor, getters, setters
}

// Sort by name
Comparator<Person> nameComparator = Comparator.comparing(Person::getName);

// Sort by salary (descending)
Comparator<Person> salaryComparator = Comparator.comparingDouble(Person::getSalary).reversed();

// Usage
List<Person> people = ...;
people.sort(nameComparator); // Sort by name
people.sort(salaryComparator); // Sort by salary
```

---

### **Real-World Scenarios**
1. **Natural Ordering** (`Comparable`):
   - Sorting numbers (`Integer`, `Double`).
   - Sorting strings alphabetically.
   - Sorting dates chronologically.

2. **Custom Sorting** (`Comparator`):
   - Sorting employees by salary, name, or hire date.
   - Sorting products by price, category, or rating.
   - Sorting files by size, extension, or last modified time.

---

### **Java 8+ Enhancements for `Comparator`**
Java 8 introduced fluent APIs for creating comparators:
```java
// Sort by name, then by salary
Comparator<Person> comparator = Comparator
    .comparing(Person::getName)
    .thenComparingDouble(Person::getSalary);

// Reverse order
Comparator<Person> reverseComparator = comparator.reversed();
```

---

### **Choosing Between `Comparable` and `Comparator`**
| Use Case                                      | Recommendation       |
|-----------------------------------------------|----------------------|
| Natural ordering (e.g., `String`, `Integer`)  | `Comparable`         |
| Multiple sorting strategies                   | `Comparator`         |
| Sorting third-party classes                   | `Comparator`         |
| Dynamic or runtime sorting criteria           | `Comparator`         |
| Immutable class (no source access)            | `Comparator`         |

---

### **Summary**
- **`Comparable`**: Define the **default** way to sort a class.
- **`Comparator`**: Define **alternate** or **external** ways to sort.

Use `Comparable` for natural ordering and `Comparator` for flexibility and decoupling. In modern Java (8+), prefer `Comparator` for its expressive and reusable sorting logic.