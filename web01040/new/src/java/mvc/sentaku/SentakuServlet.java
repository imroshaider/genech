package mvc.sentaku;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mvc.login.Validate;



public class SentakuServlet extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
HttpSession session = request.getSession();
String uid = (String)session.getAttribute("userid");
String hopeid = request.getParameter("ID");
String Cid = request.getParameter("Cid");
String Cname = request.getParameter("Cname");

SentakuBean sentakubean = new SentakuBean();

sentakubean.setHopeid(hopeid);
sentakubean.setUid(uid);
sentakubean.setUname(Cname);
sentakubean.setCid(Cid);
sentakubean.setPayment("NO");
sentakubean.setPaid("NO");

SentakuDao sentakuDao = new SentakuDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.

String user = sentakuDao.Sentakuupdate(sentakubean);
if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
     
             session.setAttribute("hopeid", request.getParameter("ID"));
                   response.sendRedirect("sentakumodal.jsp");
}
else   //On Failure, display a meaningful message to the User.
{
request.setAttribute("errMessage", user);
request.getRequestDispatcher("/index.jsp").forward(request, response);
}
    }
}
    
   