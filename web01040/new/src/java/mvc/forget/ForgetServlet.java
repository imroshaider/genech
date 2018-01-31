
package mvc.forget;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mvc.Database.DBConnection;
import mvc.kibou.KibouBean;
import mvc.kibou.KibouDao;
import mvc.mail.sendMail;
public class ForgetServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public ForgetServlet() {
}

  
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    
        
        
  
        String email = request.getParameter("email");
        String pass="";
        String subject="forget";
       try {
        Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
    
    String name="SELECT * FROM user WHERE Mail='"+email+"'";
    System.out.print(email);
        preparedStatement = con.prepareStatement(name);
    
  ResultSet x =preparedStatement.executeQuery();
 while(x.next()){
       pass =x.getString("PASS");
 }
 } catch (SQLException ex) {
        Logger.getLogger(ForgetServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
       
          sendMail send=new sendMail();
     send.Sendemail(email , subject ,pass);



String user = "SUCCESS";

if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("forget.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("/profile.jsp").forward(request, response);
}
   
			
}
}