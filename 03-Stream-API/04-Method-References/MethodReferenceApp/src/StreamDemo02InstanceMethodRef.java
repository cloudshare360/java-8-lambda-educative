import java.util.ArrayList;
import java.util.List;

public class StreamDemo02InstanceMethodRef {

    public int getLength(String str) {
        return str.length();
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("done");
        list.add("word");
        list.add("practice");
        list.add("fake");



        StreamDemo02InstanceMethodRef demo = new StreamDemo02InstanceMethodRef();
        // Code without instance method reference.
        System.out.println("### Code without instance method reference.###");
        list.stream()
                .mapToInt(str -> demo.getLength(str))
                .forEach(System.out::println);
        
        // Code with instance method reference with word and word length
        System.out.println("###Code with instance method reference with word and word length###");
        list.stream()
        .map(word -> word + " - " + demo.getLength(word))
        .forEach(System.out::println);

        // Code with instance method reference.
        System.out.println("###Code with instance method reference.###");
        list.stream()
                .mapToInt(demo::getLength)
                .forEach(System.out::println);

    }
}