import java.util.function.UnaryOperator;

public class CapturingLambdaDemoV2 {

    public static void main(String args[]) {

        int i = 6;
        i = 7; // Since we have changed the value of i, the below line will not compile.

        UnaryOperator<Integer> operator = (input) -> input * i;

        System.out.println(operator.apply(j));

    }
}