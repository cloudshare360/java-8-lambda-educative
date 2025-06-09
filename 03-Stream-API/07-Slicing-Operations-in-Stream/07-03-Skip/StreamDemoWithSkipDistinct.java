import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class StreamDemoWithSkipDistinct {

    public static void main(String[] args) {
        List<String> countries = new ArrayList<>();
        countries.add("India");
        countries.add("USA");
        countries.add("China");
        countries.add("India");
        countries.add("UK");
        countries.add("China");

        countries.stream()
                .distinct()
                .skip(2)
                .forEach(System.out::println);
        List<String> distinctCountriesWithSkippedList = countries
                                                        .stream()
                                                        .distinct().skip(2).collect(Collectors.toList());
        System.out.println("distinctCountriesWithSkippedList"+ distinctCountriesWithSkippedList);

    }
}
