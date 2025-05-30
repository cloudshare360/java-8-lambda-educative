import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class StreamDemoMap {

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("Dave");
        list.add("Joe");
        list.add("Ryan");
        list.add("Iyan");
        list.add("Ray");

        // Convert to uppercase and print
        System.out.println("Uppercase Names:");
        list.stream()
            .map(name -> name.toUpperCase())
            .sorted()
            .forEach(System.out::println);

        // Convert to uppercase first, then sort, then collect
        List<String> sortedUpperList = list.stream()
            .map(String::toUpperCase)  // Convert to uppercase first
            .sorted()                   // Now sort the uppercase names
            .collect(Collectors.toList());

        System.out.println("\nSorted Uppercase List:");
        System.out.println(sortedUpperList);
    }
}