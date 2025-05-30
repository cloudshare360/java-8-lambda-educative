public class WellWisherV3 {
    public static void wish(Greeting greeting) {
        greeting.greet();
    }

    public static void main(String args[]) {

        wish(() -> System.out.println("Namaste"));

    }
}