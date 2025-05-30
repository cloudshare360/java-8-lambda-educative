@FunctionalInterface
public interface Functional {
    
    void doSomethingUsingFunctionalInterface();

    default void foo() {
        System.out.println("foo");
    }
}