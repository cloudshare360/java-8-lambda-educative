import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class StreamDemoFindFirst {

    public static void main(String[] args) {
        List<Person> list = new ArrayList<>();
        list.add(new Person("Dave", 23,"India"));
        list.add(new Person("Joe", 18,"USA"));
        list.add(new Person("Ryan", 54,"Canada"));
        list.add(new Person("Iyan", 5,"India"));
        list.add(new Person("Ray", 63,"China"));

       // list.stream().forEach(p-> System.out.println(p));
        // ✅ This will print each Person using your custom toString()
        list.stream()
            .forEach(p -> System.out.println(p));

         Optional<Person> person = list.stream()               // Creating a Stream of person objects.
                 .filter(p -> p.getCountry().equals("India")) // Filter to get only persons living in India.
                 .findFirst();                                // Returning the first person encountered.

         if(person.isPresent()){
             System.out.println(person);
         }

    }
}


class Person {
    String name;
    int age;
    String country;

    Person(String name, int age, String country) {
        this.name = name;
        this.age = age;
        this.country = country;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getCountry() {
        return country;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", country=" + country +
                '}';
    }

}
