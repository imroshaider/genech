
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

public class Kakuninservlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public Kakuninservlet() {
}

    
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Copying all the input parameters in to local variables

String to= request.getParameter("Email");
String pass=request.getParameter("Pass");
String name=request.getParameter("Name");
String from = "nipahaider47@gmail.com";
KakuninBean kakuninBean = new KakuninBean();
 
kakuninBean.setEmail(to);
kakuninBean.setName(name);
kakuninBean.setPass(pass);
KakuninDao Kakunindao = new KakuninDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = Kakunindao.kakuninupdate(kakuninBean);
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
                    new InternetAddress(to, "");

            mimeMessage.setRecipient(Message.RecipientType.TO, toAddress);

            InternetAddress fromAddress = 
                    new InternetAddress(from,"EasyTreavel");

            mimeMessage.setFrom(fromAddress);

            mimeMessage.setSubject("Welcome to EasyTreavel ", "ISO-2022-JP");

            mimeMessage.setText(name+"御中\n" +
"この度はEasyTravelの企業登録の申請をしていただき、誠にありがとうございます。\n" +
"\n" +
"貴社の本登録が完了しましたので、お知らせします。\n" +
"\n" +
"EasyTravlをご利用いただく際、申請時に登録して頂いた" +
"「ログインID」、「パスワード」が必要となります。\n" +
"\n" +
"又、ご登録いただいた情報は、\n" +
"ログイン後、マイページより確認・変更が可能です。\n" +
"\n" +
"ログインID:\n" +to+
"\nパスワード:\n" +pass+
"\n" +
"EasyTravel\n" +
"URL\n" +
"\n" +
"今後ともEasyTravelをよろしくお願い致します。\n" +
"\n" +
"\n" +
"＝＝＝＝＝＝＝＝＝＝\n" +
"EasyTravel\n" +
"\n" +
"[お問い合わせ]\n" +
"Mail: ", "ISO-2022-JP");

            Transport.send(mimeMessage);
  response.sendRedirect("kanri.jsp");
        }
        catch(Exception e){
        out.println("<html><body>");
            out.println("■担当者への送信に失敗しました");
            out.println("<br>エラーの内容" + e);
            out.println("</body></html>");
        }

       
    }

}
 
 
