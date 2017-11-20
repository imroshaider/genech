package mvc.teian;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class TeianServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public TeianServlet() {
}

  
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
 
String Cid=(String)request.getSession().getAttribute("userid");
String CName=request.getParameter("CName");
String UName = request.getParameter("username");
String Uid=request.getParameter("userid");
String Des1 = request.getParameter("des1");
String Cost = request.getParameter("cost");
String Detail = request.getParameter("detail");
String Hotel = request.getParameter("hotel");
String People = request.getParameter("people");
String CheckIn = request.getParameter("checkin");
String Checkout = request.getParameter("checkout");
String Vehocle = request.getParameter("vehicle");
String uuid=request.getParameter("uuid");



TeianBean teianBean = new TeianBean();
//Using Java Beans - An easiest way to play with group of related data
teianBean.setCid(Cid);
teianBean.setCName(CName);
teianBean.setuName(UName);
teianBean.setUid(Uid);
teianBean.setDes1(Des1);
teianBean.setCost(Cost);
teianBean.setDetail(Detail);
teianBean.setHotel(Hotel);
teianBean.setPeople(People);
teianBean.setCheckIn(CheckIn);
teianBean.setCheckout(Checkout);
teianBean.setVehocle(Vehocle);
teianBean.setUuid(uuid);
      
TeianDao teianDao = new TeianDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = teianDao.teianupdate(teianBean);

if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("C_mypage.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("/profile.jsp").forward(request, response);
}
   
			
}
}