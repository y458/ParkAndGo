package com.example.parkbnb.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;

public class MailUtils {
    static Properties mailserverproperties;
    static Session mailsession;
    static MimeMessage mymailmessage;

    public void sendConfirmationMail(String userMail, String generatedLink) throws AddressException, MessagingException {
        mailserverproperties = System.getProperties();
        mailserverproperties.put("mail.smtp.port", "587");
        mailserverproperties.put("mail.smtp.auth", "true");
        mailserverproperties.put("mail.smtp.starttls.enable", "true");
        mailsession = Session.getInstance(mailserverproperties, null);
        mymailmessage = new MimeMessage(mailsession);
        mymailmessage.addRecipient(Message.RecipientType.TO, new InternetAddress(userMail));
        mymailmessage.setSubject("By ParkBnb:Please confirm your email");
        Multipart multipart = new MimeMultipart();
        MimeBodyPart mimeBodyPartforBody = new MimeBodyPart();
        String emailBody = "Thank you for registering. \n Please click the link below to confirm your email. \n http://localhost:8080/confirm/"+generatedLink;
        mimeBodyPartforBody.setText(emailBody);
        multipart.addBodyPart(mimeBodyPartforBody);
        mymailmessage.setContent(multipart);
        Transport transport = mailsession.getTransport("smtp");
        transport.connect("smtp.gmail.com", "parkappli", "park123123");
        transport.sendMessage(mymailmessage, mymailmessage.getAllRecipients());
        transport.close();
    }

    public String generateRandomArray() {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            int index= (int) (AlphaNumericString.length()* Math.random());
            sb.append(AlphaNumericString.charAt(index));
        }
        return String.valueOf(sb);
    }
}
