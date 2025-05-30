public class Car implements Vehicle {
    
    // one can't overrider static methods using interface
    // @Override
    // public void cleanVehicle() {
    //     System.out.println("Cleaning the vehicle");
    // }

    public static void main(String args[]) {
        Car car = new Car();
       // Car.cleanVehicle();
       Vehicle.cleanVehicle();

    }
}