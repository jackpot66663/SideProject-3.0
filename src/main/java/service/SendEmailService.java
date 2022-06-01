package service;

import dao.AccountDAO;
import org.apache.log4j.Logger;
import util.EmailProperties;
import util.FileProperties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmailService {
    private static String adminemail = FileProperties.getInstance().getProperty("admin.email");
    private static String adminpassword = FileProperties.getInstance().getProperty("admin.password");

    public static Logger logger = Logger.getLogger(AccountDAO.class);

    public static void sendEmailBySSL(String username, String useremail) {
        Properties prop = EmailProperties.set();
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(adminemail, adminpassword);
                    }
                });

        AccountDAO account = new AccountDAO();
        String userpassword = account.getPasswordByUsername(username);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(adminemail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(useremail));
            message.setSubject("Test");
            message.setText("Dear " + username + "," + "\n\n Your password is " + userpassword
                    + "\n\n Please don't reply this email back.\nThank You!!!!!");
            Transport.send(message);
        } catch (MessagingException e) {
            System.out.println(e);
            logger.error("CreateEmailFailed:", e);
        }
    }
}
