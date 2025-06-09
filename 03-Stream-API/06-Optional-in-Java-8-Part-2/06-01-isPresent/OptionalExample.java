import java.util.Optional;

public class OptionalExample {

    // Method that may or may not return a Person
    public static Optional<Person> getPerson(boolean shouldExist) {
        if (shouldExist) {
            return Optional.of(new Person("Alice"));
        } else {
            return Optional.empty();
        }
    }

    public static void main(String[] args) {
        // Try with person present
        System.out.println("Case 1: Person exists");
        Optional<Person> optionalPerson1 = getPerson(true);
        if (optionalPerson1.isPresent()) {
            System.out.println("Name: " + optionalPerson1.get().getName());
        } else {
            System.out.println("Person is null.");
        }

        // Try with person NOT present
        System.out.println("\nCase 2: Person does not exist");
        Optional<Person> optionalPerson2 = getPerson(false);
        if (optionalPerson2.isPresent()) {
            System.out.println("Name: " + optionalPerson2.get().getName());
        } else {
            System.out.println("Person is null.");
        }
    }
}

class Person {
    private String name;

    public Person(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}