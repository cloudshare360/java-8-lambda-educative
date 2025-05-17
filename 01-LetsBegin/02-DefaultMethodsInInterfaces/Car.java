public class Car extends Vehicle {

    @Override
    void cleanVehicle()
    {
       System.out.println("Cleaning the vehicle started");
    }

    public static void main(String args[])
    {
       Car car = new Car();
       car.cleanVehicle();
       car.startVehicle();
    }

}