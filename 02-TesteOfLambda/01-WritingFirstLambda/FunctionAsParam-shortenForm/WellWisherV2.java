public class WellWisherV2 {

    public static void wish(Greeting greeting) {
        greeting.greet();
    }

    public static void main(String args[]) {

        // // We are passing an anonymous class object to the wish method.
        // wish(new Greeting() {
        //     @Override
        //     public void greet() {
        //         System.out.println("Namaste");
        //     }
        // });

        //Step 1 -> The compiler knows that the wish(Greeting greeting) method takes in a parameter of type Greeting.
        // wish(
        //     @Override
        //     public void greet() {
        //         System.out.println("Namaste");
        //     }
        //     );

        //Step 2 -> We know that the Greeting interface has only one method. So, we don’t need to provide the method name.
        // wish(

        //     public void () {
        //         System.out.println("Namaste");
        //     }
        //     );

        // wish(
        //         () -> {
        //             System.out.println("Namaste");
        //         }
        // );
          wish(() -> System.out.println("Namaste") );

    }
}