
package mvc.feedback;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class FeedbackServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public FeedbackServlet() {
}

 
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Copying all the input parameters in to local variables
HttpSession session = request.getSession();
String Uid = (String)session.getAttribute("userid");
String hopeid = request.getParameter("ID");
String Cid = request.getParameter("Cid");
String Pdetail = request.getParameter("fp");
String Cdetail = request.getParameter("fc");
String Next = request.getParameter("use");
String comment = request.getParameter("f_comment");



FeedbackBean feedbackBean = new FeedbackBean();
//Using Java Beans - An easiest way to play with group of related data
feedbackBean.setHopeid(hopeid);
feedbackBean.setUid(Uid);
feedbackBean.setCid(Cid);
feedbackBean.setPdetail(Pdetail);
feedbackBean.setCdetail(Cdetail);
feedbackBean.setNext(Next);
feedbackBean.setComment(comment);


FeedbackDao feedbackDao = new FeedbackDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = feedbackDao.feedbackupdate(feedbackBean);

if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("sentakuinfo.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("/feedback.jsp").forward(request, response);
}
   
			
}
}