package mvc.register;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class RegisterServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public RegisterServlet() {
}

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Copying all the input parameters in to local variables
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String mail = request.getParameter("mail");

RegisterBean registerBean = new RegisterBean();
//Using Java Beans - An easiest way to play with group of related data
registerBean.setID(userid);
registerBean.setPASS(pass);
registerBean.setMail(mail); 
RegisterDao registerDao = new RegisterDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String userRegistered = registerDao.registerUser(registerBean);
if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
    HttpSession session = request.getSession();
             session.setAttribute("userid", userid);
                   response.sendRedirect("mypage.jsp");
}
else   //On Failure, display a meaningful message to the User.
{
request.setAttribute("errMessage", userRegistered);
request.getRequestDispatcher("/index.jsp").forward(request, response);
}
   
			
}
}