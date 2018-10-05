
public class App {

	static int a=77;
    // 인사 문구를 저장하는 변수
    String message = "ㅓㅏㅁ니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니니닐ㅇ";
    
    public String getGreeting() {
        return message;
    }
    
    public String getGreeting(String name) {
        return message + name;
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
    }
}
