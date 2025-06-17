import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class StreamDemoSumUsingParallelStream {

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        list.add(6);

        int totalSum = list.parallelStream()
                .reduce(0, (partialSum, num) -> partialSum + num, Integer::sum);

        System.out.println("Total Sum is " + totalSum);
    }
}