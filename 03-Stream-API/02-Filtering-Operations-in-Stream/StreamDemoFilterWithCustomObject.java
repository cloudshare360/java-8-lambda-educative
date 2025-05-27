import java.util.ArrayList;
import java.util.List;

public class StreamDemoFilterWithCustomObject {

  public static void main(String[] args) {
    // Created a list of Person object.
    List<Person> list = new ArrayList<>();
    list.add(new Person("Dave", 23));
    list.add(new Person("Joe", 18));
    list.add(new Person("Ryan", 54));
    list.add(new Person("Iyan", 5));
    list.add(new Person("Ray", 63));

    // We are filtering out those persons whose age is more than 18 and less than 60
    list.stream().filter(person -> person.getAge() > 18 && person.getAge() < 60).forEach(System.out::println);

  }
}

class Person {
  String name;
  int age;

  Person(String name, int age) {
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
    return "Person{" + "name='" + name + '\'' + ", age=" + age + '}';
  }

}