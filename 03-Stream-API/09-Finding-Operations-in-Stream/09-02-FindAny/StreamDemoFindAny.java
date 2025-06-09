import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class StreamDemoFindAny {

  public static void main(String[] args) {
    List<Person> list = new ArrayList<>();
    list.add(new Person("Dave", 23, "India"));
    list.add(new Person("Joe", 18, "USA"));
    list.add(new Person("Ryan", 54, "Canada"));
    list.add(new Person("Iyan", 5, "India"));
    list.add(new Person("Ray", 63, "China"));

    Optional<Person> person = list.stream().filter(p -> p.getCountry().equals("India")).findAny();

    person.ifPresent(p -> System.out.println("Found: " + p.getAge()));
    if (person.isPresent()) {
      Person p = person.get(); // extract Person from Optional
      System.out.println("Found: " + p.toString());
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
    return "Person{" + "name='" + name + '\'' + ", age=" + age + ", country='" + country + '\'' + '}';
  }
}