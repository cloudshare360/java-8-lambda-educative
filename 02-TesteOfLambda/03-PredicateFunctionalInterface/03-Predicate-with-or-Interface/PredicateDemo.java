import java.util.function.Predicate;

public class PredicateDemo {

    static boolean isPersonEligibleForRetirement(Person person, Predicate<Person> predicate){
        return predicate.test(person);
    }


    public static void main (String args[]){
        Person person1 = new Person("Alex", 33); // false
        Person person2 = new Person("Alex", 61); // false
        // Created a predicate. It returns true if age is greater than 60.
        Predicate<Person> greaterThanSixty = (p) -> p.age > 18;
        // Created a predicate. It returns true if year of service is greater than 30.
        Predicate<Person> serviceMoreThanThirty = (p) -> p.yearsOfService > 60;
        Predicate<Person> predicate = greaterThanSixty.or(serviceMoreThanThirty);

        boolean eligible1 = isPersonEligibleForRetirement(person1 , predicate);
        System.out.println("Person1 is eligible for membership: " + eligible1);

         boolean eligible2 = isPersonEligibleForRetirement(person2 , predicate);
        System.out.println("Person2 is eligible for membership: " + eligible2);

        
    }
}

class Person {
    String name;
    int age;
    int yearsOfService;

    Person(String name, int age){
        this.name = name;
        this.age = age;
        this.yearsOfService = yearsOfService;
    }
}