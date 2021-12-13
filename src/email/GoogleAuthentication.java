package email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("hotelthemoon11@gmail.com", "moon2020!");
	
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
