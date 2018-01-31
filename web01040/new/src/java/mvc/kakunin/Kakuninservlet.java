
package mvc.kakunin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import mvc.Database.DBConnection;
import mvc.mail.sendMail;

public class Kakuninservlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public Kakuninservlet() {
}

    
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Copying all the input parameters in to local variables

String to= request.getParameter("Email");
String pass=request.getParameter("Pass");
String name=request.getParameter("Name");
String from = "nipahaider47@gmail.com";
KakuninBean kakuninBean = new KakuninBean();
 String subject="hello himu";
 String naiyou="hello hello";
kakuninBean.setEmail(to);
kakuninBean.setName(name);
kakuninBean.setPass(pass);
KakuninDao Kakunindao = new KakuninDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = Kakunindao.kakuninupdate(kakuninBean);
     sendMail send=new sendMail();
     send.Sendemail(to, subject,naiyou);
     
     if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("kanri.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("C_profile.jsp").forward(request, response);
}

//request.setCharacterEncoding("UTF-8");
//      
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out = response.getWriter();
////      try{
////            Properties property = new Properties();
////
////            property.put("mail.smtp.host","smtp.gmail.com");
////
////            //GmailのSMTPを使う場合
////            property.put("mail.smtp.auth", "true");
////            property.put("mail.smtp.starttls.enable", "true");
////            property.put("mail.smtp.host", "smtp.gmail.com");
////            property.put("mail.smtp.port", "587");
////            property.put("mail.smtp.debug", "true");
////
////            Session session = Session.getInstance(property, new javax.mail.Authenticator(){
////                protected PasswordAuthentication getPasswordAuthentication(){
////                    return new PasswordAuthentication("nipahaider47@gmail.com", "NIpahaider");
////                }
////            });
////            
////            MimeMessage mimeMessage = new MimeMessage(session);
////
////            InternetAddress toAddress = 
////                    new InternetAddress(to, "nishimoto");
////
////            mimeMessage.setRecipient(Message.RecipientType.TO, toAddress);
////
////            InternetAddress fromAddress = 
////                    new InternetAddress(from,"EasyTreavel");
////
////            mimeMessage.setFrom(fromAddress);
////
////            mimeMessage.setSubject("Welcome to EasyTreavel ", "ISO-2022-JP");
////
////            mimeMessage.setText("hello nishimoto ", "ISO-2022-JP");
////
////            Transport.send(mimeMessage);
////  response.sendRedirect("kanri.jsp");
////        }
////        catch(Exception e){
////        out.println("<html><body>");
////            out.println("■担当者への送信に失敗しました");
////            out.println("<br>エラーの内容" + e);
////            out.println("</body></html>");
////        }

       
    }

}
 
 
