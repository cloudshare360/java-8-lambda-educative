import java.util.function.Predicate;

public class PredicateDemo {

  static boolean isPersonEligibleForVoting(Person person, Predicate<Person> predicate){
    return predicate.test(person);
  }


  public static void main (String args[]){
    Person person = new Person("Alex", 23);
    // Created a predicate. It returns true if age is greater than 18.
    Predicate<Person> predicate = p -> p.age > 18;

    boolean eligible = isPersonEligibleForVoting(person , predicate);
    
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