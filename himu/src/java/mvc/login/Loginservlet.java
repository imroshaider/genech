package mvc.login;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mvc.login.Validate;

public class Loginservlet extends HttpServlet {
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
             
             
       String userid = request.getParameter("userid");
       
      String password = request.getParameter("password");
        
          
        if(Validate.checkUser(userid, password))
        {
       
            HttpSession session = request.getSession();
             session.setAttribute("userid", userid);
             
          response.sendRedirect("mypage.jsp");
        }
        else
        {
           response.sendRedirect("index.jsp");
        }
    }  

    
}
