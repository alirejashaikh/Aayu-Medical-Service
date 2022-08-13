package DaoImplement;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmailDao {
    public static String SendEmail(String subject, String body, String FilePath, String toEmail) {
		
		final String username = "aayumedicalservice@gmail.com";
		final String password = "Aayu2022";
		String fromEmail = "aayumedicalservice@gmail.com";
		
                
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
		});
		
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject(subject);
			
			Multipart emailContent = new MimeMultipart();
			
			//Text body part
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText(body);
                       
                        //Attach body parts
			emailContent.addBodyPart(textBodyPart);
                        
			if(FilePath != null)
                        {
			//Attachment body part.
			MimeBodyPart pdfAttachment = new MimeBodyPart();
			pdfAttachment.attachFile(FilePath);
                        //MimeBodyPart pdfAttachment1 = new MimeBodyPart();
			//pdfAttachment1.attachFile("   ");
                        emailContent.addBodyPart(pdfAttachment);
                        }
			
			//Attach multipart to message
			msg.setContent(emailContent);
			
			Transport.send(msg);
			System.out.println("Mail send Successfuly....");
                        return "SUCCESS";
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
        return "FAIL TO SEND MAIL";
	}
}
