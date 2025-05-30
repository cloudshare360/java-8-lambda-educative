import java.util.function.BiPredicate;

public class PredicateTest {

  static boolean isPersonEligibleForVoting(
      Person person, Integer minAge, BiPredicate<Person, Integer> predicate) {
    return predicate.test(person, minAge);
  }

  public static void main(String args[]) {
    Person person = new Person("Alex", 23);
    boolean eligible =
        isPersonEligibleForVoting(
            person,
            18,
            (p, minAge) -> {
              return p.age > minAge;
            });
    System.out.println("Person is eligible for voting: " + eligible);
  }
}

class Person {
  String name;
  int age;

  Person(String name, int age){
    this.name = name;
    this.age = age;
  }
}