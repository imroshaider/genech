
package mvc.Companypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mvc.Companypage.CompanyBean;
import mvc.Companypage.comapanyDao;

/**
 *
 * @author imros
 */
public class ProfileservletCompany extends HttpServlet {
    




    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Copying all the input parameters in to local variables
HttpSession session = request.getSession();
String process = request.getParameter("process");

if(process.equals("chenge")){
    
// String Email = request.getParameter("Email");
 // テストデータ
 System.out.println("let's chenged");
 String Email = (String)session.getAttribute("userid");
 String CName = request.getParameter("C_name");
 String C_HP = request.getParameter("C_HP");
 String C_Tel = request.getParameter("Tel");
 String C_address = request.getParameter("C_address");
 String C_Post = request.getParameter("C_post");
 String detail = request.getParameter("C_info");
 
 System.out.println("Email is "+Email);
 System.out.println("CName is "+CName);
 System.out.println("C_HP "+C_HP);
 System.out.println("C_HP is "+C_HP);
 System.out.println("C_address is "+C_address);
 System.out.println("C_Post is "+C_Post);
 System.out.println("detail is "+detail);
 
 
CompanyBean Companybean = new CompanyBean();
//Using Java Beans - An easiest way to play with group of related data
Companybean.setEmail(Email);
Companybean.setName(CName);
Companybean.setUrl(C_HP);
Companybean.setTel(C_Tel);
Companybean.setAddress(C_address);
Companybean.setPost(C_Post);
Companybean.setDetail(detail);   
    
comapanyDao companydao = new comapanyDao();
String user= companydao.profilechange(Companybean);
if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("C_mypage.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("C_profile.jsp").forward(request, response);
}

}else{

System.out.println("No changed");
String Email = request.getParameter("Email");
String Name = request.getParameter("Name");
String Pass = request.getParameter("Pass");
String Address = request.getParameter("Address");
String Code = request.getParameter("Code");
String Url = request.getParameter("Url");

CompanyBean Companybean = new CompanyBean();
//Using Java Beans - An easiest way to play with group of related data
Companybean.setEmail(Email);
Companybean.setName(Name);
Companybean.setPass(Pass);
Companybean.setAddress(Address);
Companybean.setCode(Code);
Companybean.setUrl(Url);

comapanyDao companydao = new comapanyDao();
//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
String user = companydao.companyeupdate(Companybean);
if(user.equals("SUCCESS"))   //On success, you can display a message to user on Home page
{
response.sendRedirect("index.jsp");

}
else   //On Failure, display a meaningful message to the User.
{

request.getRequestDispatcher("Company.jsp").forward(request, response);
}
}
 			
}
}