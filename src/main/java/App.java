/*
 * This Java source file was generated by the Gradle 'init' task.
 */
public class App {
    static int a=77;
    String m="반갑네";
    public String getGreeting() {
        return m;
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
        System.out.println("시공으로");
        System.out.println(a);
    }
}
