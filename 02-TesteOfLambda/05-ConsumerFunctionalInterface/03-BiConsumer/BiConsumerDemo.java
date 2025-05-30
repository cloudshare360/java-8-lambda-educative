import java.util.function.BiConsumer;

public class BiConsumerDemo {

    public static void main(String[] args) {

      BiConsumer<String, String> greet = (s1, s2) -> System.out.println(s1 + " "+ s2);
      greet.accept("Hello", "World");

    }
}