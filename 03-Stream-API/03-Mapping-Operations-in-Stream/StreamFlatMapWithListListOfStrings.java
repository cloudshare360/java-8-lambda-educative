import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class StreamFlatMapWithListListOfStrings {

  public static void main(String[] args) {
    List<List<String>> list = new ArrayList<>();
    list.add(Arrays.asList("a", "b", "c"));
    list.add(Arrays.asList("d", "e", "f"));
    list.add(Arrays.asList("g", "h", "i"));
    list.add(Arrays.asList("j", "k", "l"));

    Stream<List<String>> stream1 = list.stream();
    // filter() method do not work on stream of collections
    Stream<List<String>> stream2 = stream1.filter(x -> "a".equals(x.toString()));
    // This will not print anything
    stream2.forEach(System.out::println);
    // need to use flat map which will convert into premitives in order to print the
    // data
    // list.stream().flatMap(s -> s.stream()).filter(x ->
    // "a".equals(x)).forEach(System.out::println);
    list.stream().flatMap(s -> s.stream()).filter(x -> x.compareTo("b") > 0).forEach(System.out::println);

  }
}
