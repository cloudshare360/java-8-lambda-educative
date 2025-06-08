import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class OptionalDemoOrElse {

    public static void main(String[] args) {

        Optional<String> optional = Optional.ofNullable(null);
        // This will return the default value.
        System.out.println(optional.orElse("default string"));
    }
}