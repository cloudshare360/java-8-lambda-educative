import java.util.ArrayList;
import java.util.List;

public class StreamDemoStreamArrayOfStringsToFlatMapStreamStrings {

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("Dave");
        list.add("Joe");
        list.add("Ryan");
        list.add("Iyan");
        list.add("Ray");
        // map() is used to convert each name to upper case.
        // Note: The map() method does not modify the original list.
        list.stream().map(name -> name.toUpperCase()) // map() takes an input of Function<T, R> type.
                .forEach(System.out::println); // forEach() takes an input of Consumer type.

    }
}