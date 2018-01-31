/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.mail;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;



/**
 *
 * @author imros
 */
public class sendMail {

public String  Sendemail(String email,String subject,String naiyou) throws UnsupportedEncodingException{  

    
                 
    String to = email;
    String from="nipahaider47@gmail.com";
    String detail=naiyou;
    MockHttpServletRequest request = new MockHttpServletRequest();
    MockHttpServletResponse response= new MockHttpServletResponse();
        request.setCharacterEncoding("UTF-8");
      
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
      try{
            Properties property = new Properties();

            property.put("mail.smtp.host","smtp.gmail.com");

            //GmailのSMTPを使う場合
            property.put("mail.smtp.auth", "true");
            property.put("mail.smtp.starttls.enable", "true");
            property.put("mail.smtp.host", "smtp.gmail.com");
            property.put("mail.smtp.port", "587");
            property.put("mail.smtp.debug", "true");

            Session session = Session.getInstance(property, new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication("nipahaider47@gmail.com", "NIpahaider");
                }
            });
            
            MimeMessage mimeMessage = new MimeMessage(session);

            InternetAddress toAddress = 
                    new InternetAddress(to, "nishimoto");

            mimeMessage.setRecipient(Message.RecipientType.TO, toAddress);

            InternetAddress fromAddress = 
                    new InternetAddress(from,"EasyTreavel");

            mimeMessage.setFrom(fromAddress);

            mimeMessage.setSubject("Welcome to EasyTreavel ", "ISO-2022-JP");

            mimeMessage.setText(detail, "ISO-2022-JP");

            Transport.send(mimeMessage);
  response.sendRedirect("kanri.jsp");
        }
        catch(Exception e){
        out.println("<html><body>");
            out.println("■担当者への送信に失敗しました");
            out.println("<br>エラーの内容" + e);
            out.println("</body></html>");
        }
        
        
        
        return null;
       }

}
