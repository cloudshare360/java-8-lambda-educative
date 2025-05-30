public class Main implements Functional {
    @Override
    public void doSomethingUsingFunctionalInterface() {
      System.out.println("Overridden doSomething method with in main class ");
    }

    public static void main(String args[])
    {    

        System.out.println("In Main");
         Main main = new Main();
        main.doSomethingUsingFunctionalInterface();
        main.foo();
    }

}

/*
 * 
 * @FunctionalInterface
public interface Functional {
    
    void doSomethingUsingFunctionalInterface();

    default void foo() {
        System.out.println("foo");
    }
}
 */