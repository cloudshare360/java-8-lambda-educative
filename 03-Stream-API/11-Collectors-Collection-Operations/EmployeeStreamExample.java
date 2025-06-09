//EmployeeStreamExample.java

import java.util.*;
import java.util.stream.Collectors;

class Employee {
  String name;
  int age;
  double salary;
  String country;

  Employee(String name, int age, double salary, String country) {
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
    return "Employee{" + "name='" + name + '\'' + ", age=" + age + ", salary=" + salary + '}';
  }
}

public class EmployeeStreamExample {
  public static void main(String[] args) {
    List<Employee> employeeList = new ArrayList<>();
    employeeList.add(new Employee("Alex", 23, 23000.00, "USA"));
    employeeList.add(new Employee("Ben", 63, 25000.00, "India"));
    employeeList.add(new Employee("Dave", 34, 56000.00, "Bhutan"));
    employeeList.add(new Employee("Jodi", 43, 67000.00, "China"));
    employeeList.add(new Employee("Ryan", 53, 54000.00, "Libya"));

    // Example 1: Print all employees
    System.out.println("All Employees:");
    employeeList.forEach(System.out::println);

    // Example 2: Filter employees from India
    List<Employee> indiaEmployees = employeeList.stream().filter(e -> e.getCountry().equals("India"))
        .collect(Collectors.toList());
    System.out.println("\nEmployees from India:");
    System.out.println(indiaEmployees);

    // Example 3: Map to names only
    List<String> employeeNames = employeeList.stream().map(Employee::getName).collect(Collectors.toList());
    System.out.println("\nEmployee Names:");
    System.out.println(employeeNames);

    // Example 4: Find high-salary employees (> 50000)
    List<Employee> highEarners = employeeList.stream().filter(e -> e.getSalary() > 50000).collect(Collectors.toList());
    System.out.println("\nHigh Earners (salary > 50000):");
    System.out.println(highEarners);

    // Example 5: Average salary
    double avgSalary = employeeList.stream().mapToDouble(Employee::getSalary).average().orElse(0);
    System.out.println("\nAverage Salary: " + avgSalary);

    // Example 6: Count employees from USA
    long usaCount = employeeList.stream().filter(e -> e.getCountry().equals("USA")).count();
    System.out.println("\nNumber of employees from USA: " + usaCount);

    // 🔑 Group employees by country
    Map<String, List<Employee>> employeesByCountry = employeeList.stream()
        .collect(Collectors.groupingBy(Employee::getCountry));

    System.out.println("employeesByCountry" + employeesByCountry);

    // Print result
    employeesByCountry.forEach((country, employees) -> {
      System.out.println("Country: " + country);
      employees.forEach(System.out::println);
      System.out.println();
    });

    // 1. Group by Country and Then by Salary Range
    Map<String, Map<Double, List<Employee>>> grouped = employeeList.stream()
        .collect(Collectors.groupingBy(Employee::getCountry, Collectors.groupingBy(Employee::getSalary)));

    // 2. Count Number of Employees per Country
    Map<String, Long> countByCountry = employeeList.stream()
        .collect(Collectors.groupingBy(Employee::getCountry, Collectors.counting()));

    employeeList.stream().collect(Collectors.groupingBy(Employee::getCountry)).forEach((country, employees) -> {
      System.out.println("Country: " + country);
      employees.forEach(System.out::println);
    });

    // 3. Get Total Salary per Country
    Map<String, Double> totalSalaryByCountry = employeeList.stream()
        .collect(Collectors.groupingBy(Employee::getCountry, Collectors.summingDouble(Employee::getSalary)));
  }
}

