public class Car implements Vehicle{

    @Override
    public void cleanVehicle()
    {
        System.out.println("clean Vehicle");
    }

    public static void main(String args[]) {

        Car car = new Car();
        car.cleanVehicle();
        car.startVehicle();
    }

}