import java.util.stream.Stream;
import java.util.Arrays;
import java.util.stream.Stream;

public class StreamDemoFilter {

    public static void main(String[] args) {
        Stream<Integer> stream = Stream.of(1, 2, 3, 4, 5, 6, 7, 8, 9);
        stream.forEach(p -> System.out.println("Stream:" + p));

        int[] intArray = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }; // ✅ Correct array declaration

        Stream<Integer> streamIntArray = Arrays.stream(intArray).boxed(); // ✅ Convert to Stream<Integer>
        String label = "intArray";
        // streamIntArray.forEach(System.out::println);
        streamIntArray.forEach(value -> System.out.println(label + ": " + value));

    }
}