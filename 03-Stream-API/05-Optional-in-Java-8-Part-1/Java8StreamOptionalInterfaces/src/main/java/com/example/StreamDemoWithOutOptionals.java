package com.example;

import java.util.HashMap;
import java.util.Map;

public class StreamDemoWithOutOptionals {

    Map<Integer, Employee> empMap = new HashMap<>();

    public Employee getEmployee(Integer employeeId) {
        return empMap.get(employeeId);
    }

    public static void main(String[] args) {
        StreamDemoWithOutOptionals demo = new StreamDemoWithOutOptionals();

        //Fetching the employee with id 123. But since map is empty this will be null.
        Employee emp = demo.getEmployee(123);

        // This will throw Null Pointer Exception because emp is null
        System.out.println(emp.getName()); 
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
