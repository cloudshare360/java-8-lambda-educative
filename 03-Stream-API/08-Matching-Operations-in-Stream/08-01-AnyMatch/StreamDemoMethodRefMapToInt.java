import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.uStreamDemoMethodRefMapToInt {

    public int getLength(String str) {
        return str.length();
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("done");
        list.add("word");
        list.add("practice");
        list.add("fake");

        StreamDemoMethodRefMapToInt demo = new StreamDemoMethodRefMapToIntanyMatch(p -> p.getCountry().equals("Canada"));

    System.out.println("Is there any resident of Canada: " + anyCanadian);

    boolean allCanadianWithFlase = list.stream().allMatch(p -> p.getCountry().equals("Canada"));

    System.out.println("Are all persons canadian: " + allCanadianWithFlase);

    // list.forEach(person -> person.setCountry("India"));
    // System.out.println("\nAfter update with country as India:");
    // list.forEach(System.out::println);

    List<Person> listWithAllCanadians = list.stream().map(p -> new Person(p, "Canada"))
        .collect(Collectors.toList());

    boolean allCanadianWithTrue = list.stream().allMatch(p -> p.getCountry().equals("Canada"));

    System.out.println("Are all persons canadian: " + allCanadianWithTrue);

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

}
