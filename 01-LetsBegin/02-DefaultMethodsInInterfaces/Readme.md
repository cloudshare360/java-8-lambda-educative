Syntax of default methods
Let’s understand the syntax of default methods through an example. Here, we have an interface with one abstract and one default method:

```
public interface Vehicle {

    void cleanVehicle();

    default void startVehicle() {
        System.out.println("Vehicle is starting");
    }
}
```
Now we will create a class which implements the vehicle interface.
```
public class Car implements Vehicle {
    @Override
    public void cleanVehicle() {
        System.out.println("Cleaning the vehicle");
    }

    public static void main(String args[]){
        Car car = new Car();
        car.cleanVehicle();
        car.startVehicle();
    }
}
```
How to resolve issues raised due to the default method
Although default methods are very good additions to Java and make developing a lot easier, they have one caveat that needs to be considered while coding.

To see this caveat, Let’s look at an example. Here, we have two interfaces with a default method of the same name, i.e., printSomething().
Interface A
```
public interface InterfaceA {

    default void printSomething() {
        System.out.println("I am inside A interface");
    }
}
```
Interface B
```
public interface InterfaceB {

    default void printSomething() {
        System.out.println("I am inside B interface");
    }
}
```