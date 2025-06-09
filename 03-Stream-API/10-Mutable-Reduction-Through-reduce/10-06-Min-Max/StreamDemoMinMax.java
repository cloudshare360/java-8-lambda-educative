import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

public class StreamDemoMinMax {

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        list.add(6);

        Optional<Integer> max = list.stream()
                .max(Comparator.naturalOrder());

        System.out.println("Max value is " + max.get());

        Optional<Integer> min = list.stream()
                .min(Comparator.naturalOrder());

        System.out.println("Min value is " + min.get());
    }
}
