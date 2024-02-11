java_path="C:\\Program Files\\Java\\jdk-21\\"

## System commands
# pentru a pune comentariu apas "ctrl+/"
# pentru a cauta in jshell apas "ctrl+R"
# pentru a te duce la inceputul randului in jshell apas "ctrl+A"
# pentru a iesi din folder in jshell apas "ctrl+D" sau "ctrl+C"
# pentru a cauta prin cod "ctrl+shift+L"
# pentru a cauta "shift+shift"
# go to declaration or usage "ctrl+B"
# "ctrl + D" to copy the current line and paste it on the next line in intellij
# to format the code "ctrl+alt+L"


# "/save nameOfFile.txt" to save all the methods created
# "/methods" to see all the methods created
# "/edit nameOfMethod" to edit a method

# "ls" to see what is in a folder

## Print
System.out.printf("%d", 7) # to print decimals
System.out.printf("%s", "Testing") # to print string
System.out.printf("%f", 5.5) # to print float

## Variables types
# byte: -128 to 128
# short: -32,768 to 32,767
# int: -2,147,483,648 to 2,147,483,648
# long: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,808
#                float: 4.5f
#                double: 4.5
# char: 'A'
# boolean: true or false

# Daca vrem sa facem o operatie cu numere intregi cu acuratete mare:
BigDecimal number1 = new BigDecimal("34.56789876");

## Method Syntax
# ReturnType nameOfTheMethod(Type argumentName) {
#     //Body of the method
# }
# "void" - method daca nu vreau sa returneze nimic

## String and List: List<String>
String str = "Test"
str.charAt(0) # get the first character from the string
str.substring(2) # get only from the 2nd character and so on
str.substring(2,5) # get the characters from 2 inclusive to 5 exclusive
str.indexOf("es") # to search if some string is from str and returns the index of the "e"
str.lastIndexOf('t') # the last appearence of a letter in a string
str.contains("ext") #verify if a string contains such a substring : returns true or false
str. + tab = show all the operation available for str
StringBuffer sb = new StringBuffer("TEst"); # can change the initial string after operations
StringBuilder = sb = new StringBuilder("test"); # more rapid

# to remove from ArrayList
jshell> Iterator<String> iterator = wordsAl.iterator();
iterator ==> java.util.ArrayList$Itr@71318ec4

jshell> while (iterator.hasNext()) {
   ...>     if (iterator.next().endsWith("at")) {
   ...>         iterator.remove();
   ...>     }
   ...> }

@Component # GENERIC ANNOTATION APLICABLE FOR ANY CLASS
           #  An instance of class will be managed by Spring Framework . We put it at the begining of any java class
@ComponentScan("com.in20minutes") ## Spring Framework find component classes
@Bean ## We put it at the begining of a method
@Service # Indicates that an annotated class has business logic
@Controller # use to define controllers in web applications
@Repository # Indicates that an annotated class is used to retrieve and/or manipulate database

@PostConstruct # Indentifies the method that will be executed after dependency injection is done to perform any initialization
@PreDestroy # Indentifies the method that will receive the callback notification to signal that the instance is in the process of being removed by the container.
            # Typically used to release resources that it has been holding.
@Named # Similar to @Component

