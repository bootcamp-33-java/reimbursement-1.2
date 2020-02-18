/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author BWP
 */
public class JavaMailUtil {

    public static void sendMail(String name, String recepient, String tokennya) throws Exception {

        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        String myAccountEmail = "pandapanpan354@gmail.com";
        String password = "yunpan1409";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Activication Account");
            message.setContent(""
                    + "<center><h1>Dear " + name + "</h1>\n"
                    + "Please Activation Your Account and Klik link bellow: \n <br><br> "
                    + "<a href=\"" + tokennya + "\"><button type=\"button\" class=\"btn btn-success\"  "
                    + "style=\"height: 100px; width: 300px; font-size:40px; background-color: #43dffa; color:white\">"
                            + "Verify Account</button></a><center>", "text/html");
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
