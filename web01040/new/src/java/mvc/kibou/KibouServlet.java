
package mvc.kibou;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class KibouServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public KibouServlet() {
}

  
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    
        
        
        HttpSession session = request.getSession();     
        String ID = (String)session.getAttribute("userid");
        String Des1 = request.getParameter("Des1");
        String Des2 = request.getParameter("Des2");
        String Des3 = request.getParameter("Des3");
        String Cost = request.getParameter("Cost");
        String CheckIn = request.getParameter("CheckIn");
        String Checkout = request.getParameter("Chekout");
        String Hope = request.getParameter("Hope");
            
        
         

KibouBean kibouBean = new KibouBean();
//Using Java Beans - An easiest way to play with group of related data
kibouBean.setId(ID);
kibouBean.setDes1(Des1);
kibouBean.setDes2(Des2);
kibouBean.setDes3(Des3);
kibouBean.setCost(Cost);
kibouBean.setCheckIn(CheckIn);
kibouBean.setCheckout(Checkout);
kibouBean.setHope(Hope);

KibouDao kiboudao = new KibouDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = kiboudao.kibouupdate(kibouBean);

if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("mypage.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("/profile.jsp").forward(request, response);
}
   
			
}
}