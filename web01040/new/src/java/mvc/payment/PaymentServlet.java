package mvc.payment;



import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mvc.payment.PaymentBean;
public class PaymentServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public PaymentServlet() {
}

  
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
 
String hopeid=request.getParameter("id");
String picture=request.getParameter("pic");




PaymentBean paymentBean = new PaymentBean();
//Using Java Beans - An easiest way to play with group of related data
paymentBean.setHopeid(hopeid);
paymentBean.setPicture("picture");
      
PaymentDao paymentDao = new PaymentDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.

String user="";
    try {
        user = paymentDao.paymentupdate(paymentBean);
    } catch (SQLException ex) {
        Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("mypage.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("payment.jsp").forward(request, response);
}
   
			
}
}