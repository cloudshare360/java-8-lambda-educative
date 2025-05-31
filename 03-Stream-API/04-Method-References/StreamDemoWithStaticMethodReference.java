import java.util.ArrayList;
import java.util.List;

public class StreamDemoWithStaticMethodReference {

  public static int getLength(String str) {
    return str.length();
  }

  public static void main(String[] args) {
    List<String> list = new ArrayList<>();
    list.add("done");
    list.add("word");
    list.add("practice");
    list.add("fake");

    // Code without using method reference.
    list.stream().mapToInt(str -> StreamDemoWithStaticMethodReference.getLength(str)).forEach(System.out::println);
    System.out.println("Using Static Method Reference");
    // Code with method reference.
    list.stream().mapToInt(StreamDemoWithStaticMethodReference::getLength).forEach(System.out::println);

  }
}
