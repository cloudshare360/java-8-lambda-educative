import java.util.function.Function;

public class FunctionInterfaceDemo {

    public static void main(String[] args) {
        // Created a function which returns the length of string.
        Function<String, Integer> lengthFunction = str -> str.length();

        System.out.println("String length: " + lengthFunction.apply("This is awesome!!"));

        Function<String, String> toUpperCase = s -> s.toUpperCase();
        System.out.println("Uppercase: " + toUpperCase.apply("hello"));

        String expected = "hello";

        Function<String, Boolean> isInputEqualToExpected = s -> expected.equals(s);

        System.out.println("Result: " + isInputEqualToExpected.apply("hello")); // true
        System.out.println("Result: " + isInputEqualToExpected.apply("hi")); // false

    }
}