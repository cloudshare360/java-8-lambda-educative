import java.util.*;
import java.util.stream.Collectors;

// Main class
public class EmployeeStreamOperations {

  // Employee class
  static class Employee {
    private String name;
    private int age;
    private double salary;
    private String country;

    public Employee(String name, int age, double salary, String country) {
      this.name = name;
      this.age = age;
      this.salary = salary;
      this.country = country;
    }

    public String getName() {
      return name;
    }

    public int getAge() {
      return age;
    }

    public double getSalary() {
      return salary;
    }

    public String getCountry() {
      return country;
    }

    @Override
    public String toString() {
      return String.format("Employee{name='%s', age=%d, salary=%.2f, country='%s'}", name, age, salary, country);
    }
  }

  public static void main(String[] args) {
    List<Employee> employeeList = new ArrayList<>();
    employeeList.add(new Employee("Alex", 23, 23000, "USA"));
    employeeList.add(new Employee("Ben", 63, 25000, "India"));
    employeeList.add(new Employee("Dave", 34, 56000, "Bhutan"));
    employeeList.add(new Employee("Jodi", 43, 67000, "China"));
    employeeList.add(new Employee("Ryan", 53, 54000, "Libya"));
    employeeList.add(new Employee("Anna", 39, 60000, "India"));

    System.out.println("=== All Employees ===");
    employeeList.forEach(System.out::println);

    // 1. Filter employees from India
    System.out.println("\n=== Employees from India ===");
    employeeList.stream().filter(e -> e.getCountry().equals("India")).forEach(System.out::println);

    // 2. Map to names only
    System.out.println("\n=== Employee Names ===");
    List<String> names = employeeList.stream().map(Employee::getName).collect(Collectors.toList());
    names.forEach(System.out::println);

    // 3. High earners (salary > 50000)
    System.out.println("\n=== High Earners (> 50,000) ===");
    employeeList.stream().filter(e -> e.getSalary() > 50000).forEach(System.out::println);

    // 4. Average Salary
    double avgSalary = employeeList.stream().mapToDouble(Employee::getSalary).average().orElse(0);
    System.out.printf("\n=== Average Salary: %.2f ===\n", avgSalary);

    // 5. Count employees per country
    System.out.println("\n=== Count of Employees by Country ===");
    employeeList.stream().collect(Collectors.groupingBy(Employee::getCountry, Collectors.counting()))
        .forEach((country, count) -> System.out.println(country + " : " + count));

    // 6. Total salary paid per country
    System.out.println("\n=== Total Salary per Country ===");
    employeeList.stream()
        .collect(Collectors.groupingBy(Employee::getCountry, Collectors.summingDouble(Employee::getSalary)))
        .forEach((country, total) -> System.out.println(country + " : " + total));

    // 7. Nested grouping: Country -> Salary -> Employees
    System.out.println("\n=== Nested Grouping: Country -> Salary -> Employees ===");
    employeeList.stream()
        .collect(Collectors.groupingBy(Employee::getCountry, Collectors.groupingBy(Employee::getSalary)))
        .forEach((country, salaryMap) -> {
          System.out.println("Country: " + country);
          salaryMap.forEach((salary, employees) -> {
            System.out.println("  Salary: " + salary);
            employees.forEach(emp -> System.out.println("    " + emp.getName()));
          });
        });
  }
}