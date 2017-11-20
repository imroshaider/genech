
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

  
			
}
}