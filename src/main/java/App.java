
public class App {
    public String getGreeting() {
        return "hello";
    }
    
    public String getGreeting(String name) {
        return "Hello " + name;
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
    }
}
