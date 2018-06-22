import java.io.File;

public class Mkdir {
	public static void main(String[] args) {
		File fileDir = new File("upload");
		if(fileDir.mkdirs()) {
			System.out.println("创建成果");
		}
	}
}
