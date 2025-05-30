public class EnglishGreeting implements Greeting {
    
    // Overriding the greet() method from Greeting interface.
    @Override
    public void greet() {
        System.out.println("Good Morning");
    }
}