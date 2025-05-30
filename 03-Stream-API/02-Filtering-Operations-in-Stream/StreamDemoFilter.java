import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class StreamDemoFilter {

    public static void main(String[] args) {

        //Created a list of integers
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(12);
        list.add(23);
        list.add(45);
        list.add(6);

        list.stream()                           // Created a stream from the list
                .filter(num -> num > 10)        //filter operation to get only numbers greater than 10
                .forEach(System.out::println);  // Printing each number in the list after filtering.

        //Again printing the elements of List to show that the original list is not modified.
        System.out.println("Original list is not modified");
        list.stream() 
                .forEach(System.out::println);
    }
}
