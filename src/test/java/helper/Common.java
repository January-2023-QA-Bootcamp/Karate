package helper;

import java.time.Instant;

public class Common {

	public static Instant getTime() {
		return Instant.now();
	}
	
	public static void printOSType() {
		System.out.println(System.getProperty("os.name"));
	}
}
