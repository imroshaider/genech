package mvc.login;
import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
public class Logoutservlet extends HttpServlet {  
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
            
              
            HttpSession session=request.getSession();  
              
            session.invalidate();  
              response.sendRedirect("index.jsp");
            
    }  
}  