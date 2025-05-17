public interface Vehicle {

    void cleanVehicle();

    default void startVehicle(){

        System.out.println("Start Vehicle!");
    }
}