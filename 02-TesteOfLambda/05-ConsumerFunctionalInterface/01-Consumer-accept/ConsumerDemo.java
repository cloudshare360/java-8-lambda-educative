import java.util.function.Consumer;

public class ConsumerDemo {

public static void main(String[] args) {
		
		Consumer<String> stringConsumer = s -> System.out.println(s);
		stringConsumer.accept("Hello World.");
		
		Consumer<Integer> intConsumer = i -> System.out.println("Integer value = " + i);
		intConsumer.accept(5);
	}
}