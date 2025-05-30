import java.util.function.Predicate;
import java.util.function.Supplier;

public class SupplierTest {

    static boolean isPersonEligible(Supplier<Person> supplier, Predicate<Person> predicate) {
        return predicate.test(supplier.get());
    }

    public static void main(String args[]) {
        Supplier<Person> supplier = () -> new Person("Alex", 23);

        // Predicate to check age
        Predicate<Person> agePredicate = p -> p.age > 18;

        // Predicate to check name
        String targetName = "Alex";
        Predicate<Person> namePredicate = p -> p.name.equals(targetName);

        // Check eligibility
        boolean eligibleForVoting = isPersonEligible(supplier, agePredicate);
        boolean nameMatches = isPersonEligible(supplier, namePredicate);

        System.out.println("Person is eligible for voting: " + eligibleForVoting);
        System.out.println("Person name matches '" + targetName + "': " + nameMatches);

         // Predicate to check both name AND age
        // String targetName = "Alex";
         Predicate<Person> combinedPredicate = p -> p.name.equals(targetName) && p.age > 18;

         // Perform the check
        boolean eligible = isPersonEligible(supplier, combinedPredicate);

        System.out.println("Person is eligible (name is Alex AND age > 18): " + eligible);
 
      
    }
}

class Person {
    String name;
    int age;

    Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
}