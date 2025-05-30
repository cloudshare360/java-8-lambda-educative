import java.util.function.Function;

public class FunctionDemoCompose {

  public static void main(String args[]) {

    // Function which adds 10 to the given element.
    Function<Integer, Integer> increment = x -> x + 10;
    // Function which doubles the given element.
    Function<Integer, Integer> multiply = y -> y * 2;
    // Since we are using compose(), multiplication will be done first and then
    // increment will be done.
    System.out.println("compose result: " + increment.compose(multiply).apply(3));

  }
}