import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
        // Method References
        Consumer<String> consumer = s -> System.out.println(s);
        Consumer<String> consumerWithMethodRef = System.out::println;

        consumer.accept("Using Lambda");
        consumerWithMethodRef.accept("Using Method Reference");

        List<String> names = Arrays.asList("Alice", "Bob", "Charlie");

        names.forEach(consumer); // or consumerWithMethodRef

        names.forEach(consumerWithMethodRef); // or consumerWithMethodRef

    }
}
