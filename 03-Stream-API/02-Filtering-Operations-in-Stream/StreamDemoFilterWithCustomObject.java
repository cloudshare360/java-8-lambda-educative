import java.util.*;
import java.util.stream.Collectors;

class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    @Override
    public String toString() {
        return "Person{name='" + name + "', age=" + age + "}";
    }
}

public class StreamDemoFilterWithCustomObject {
    public static void main(String[] args) {
        List<Person> list = new ArrayList<>();

        list.add(new Person("Joe", 18));
        list.add(new Person("Ryan", 44));
        list.add(new Person("Dave", 23));
        list.add(new Person("Iyan", 5));
        list.add(new Person("Harini", 45));
        list.add(new Person("Sri", 52));
        list.add(new Person("Ray", 63));

        System.out.println("After filtering and sorting:");
        list.stream()
            //.filter(person -> person.getAge() > 18 && person.getAge() < 60)
            .filter(person -> person.getAge() > 18)
            //.filter(person -> person.getAge() > 18 && person.getAge() < 60)
           //.sorted(Comparator.comparing(Person::getName)) // Sort by age
           .sorted(Comparator.comparing(Person::getName).thenComparing(Person::getAge))
            .forEach(System.out::println);
    }
}