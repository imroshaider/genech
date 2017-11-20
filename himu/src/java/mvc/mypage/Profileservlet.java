package mvc.mypage;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class Profileservlet extends HttpServlet {
private static final long serialVersionUID = 1L;
public Profileservlet() {
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
HttpSession session = request.getSession();
String id = (String)session.getAttribute("userid");
String username = request.getParameter("username");
String sex = request.getParameter("sex");
String age = request.getParameter("age");
String keep = request.getParameter("keep");
String post = request.getParameter("post");
String address = request.getParameter("address");
String image = request.getParameter("image");



MypageBean mypageBean = new MypageBean();
//Using Java Beans - An easiest way to play with group of related data
mypageBean.setId(id);
mypageBean.setUsername(username);
mypageBean.setSex(sex);
mypageBean.setAge(age);
mypageBean.setKeep(keep);
mypageBean.setPost(post);
mypageBean.setAddress(address);
mypageBean.setImage(image);

mypageDao mypagedao = new mypageDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = mypagedao.mypageupdate(mypageBean);

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