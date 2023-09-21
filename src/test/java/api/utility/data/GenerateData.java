package api.utility.data;

public class GenerateData {
	public static String getEmail() {
		String prefix = "student.4ever";
		String sufix = "@gmail.com";
		int random = (int) (Math.random() * 1000);
		String email = prefix + random + sufix;
		return email;
	}
	
	public static String getPhoneNumber() {
		String phoneNumber = "916";
		for (int i = 0; i < 7; i ++) {
			phoneNumber += (int)  (Math.random()* 10);
		}
		
		return phoneNumber;
		
	}
	public static void main(String[] args) {
		String email = getEmail();
		//.out.println(number.length());
		System.out.println(email);
		
	}
	

}
