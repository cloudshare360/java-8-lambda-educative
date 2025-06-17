package com.example;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class StreamDemoWithOptional {

    Map<Integer, Employee> empMap = new HashMap<>();

    public Optional<Employee> getEmployee(Integer employeeId) {
        // Before returning the employee object we are wrapping it into an Optional
        return Optional.ofNullable(empMap.get(employeeId));
    }

    public static void main(String[] args) {
        StreamDemoWithOptional demo = new StreamDemoWithOptional();
        Optional<Employee> emp = demo.getEmployee(123);
        // Before getting a value from Optional we check if the value is present through isPresent() method.
        if(emp.isPresent()){
            System.out.println(emp.get().getName());  // We use get() method to get the value from Optional.
        } else{
            System.out.println("No employee returned.");
        }
    }
}

class Employee {
    String name;
    int age;
    int salary;

    Employee(String name) {
        this.name = name;
    }

    Employee(String name, int age, int salary) {
        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public int getSalary() {
        return salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", salary=" + salary +
                '}';
    }
}
