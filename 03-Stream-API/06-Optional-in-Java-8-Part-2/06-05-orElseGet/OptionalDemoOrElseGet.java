import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class OptionalDemoOrElseGet {

    public static String getDefaultValue(){
        return "\n returning default from getDefaultValue() method";
    }

    public static void main(String[] args) {

        Optional<String> optional = Optional.ofNullable(null);
        // This will return the default value.
        System.out.println(optional.orElseGet(OptionalDemoOrElseGet::getDefaultValue));
    }
}