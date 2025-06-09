import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class StreamDemoReduceWithIdentity {

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        list.add(6);

        System.out.println("Total Sum is " + list.stream().reduce((a, b) -> a + b).get());

        System.out.println("Total Sum is " + list.stream().reduce(Integer::sum).orElse(0));

        list.stream().reduce(Integer::sum).ifPresent(sum -> System.out.println(sum));

        int totalSum = list.stream().reduce(5, (partialSum, num) -> partialSum + num);

        System.out.println("Total Sum is " + totalSum);
    }

}
