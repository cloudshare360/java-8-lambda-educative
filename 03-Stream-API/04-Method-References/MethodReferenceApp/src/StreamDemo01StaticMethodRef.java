import java.util.ArrayList;
import java.util.List;

public class StreamDemo01StaticMethodRef {

    public static int getLength(String str){
        return str.length();
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("done");
        list.add("word");
        list.add("practice");
        list.add("fake");

        System.out.println("Listing Array Elements");
        list.forEach(str->System.out.println(str));

        // Code without using method reference.
        System.out.println("Printing Length of Each Word in Array");
        list.stream()
                .mapToInt(str -> StreamDemo01StaticMethodRef.getLength(str))
                .forEach(System.out::println);

        System.out.println("\nPrinting Word and Its Length:");
        list.stream()
            .map(word -> word + " - " + getLength(word)) // Combine word and length
            .forEach(System.out::println); // Print result

        // Code with method reference.
        System.out.println("Code with method reference.");
        list.stream()
                .mapToInt(StreamDemo01StaticMethodRef::getLength)
                .forEach(System.out::println);

    }
}
