package servlet;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class LoginServlet extends HttpServlet{
			
			Map<String, String> users = new HashMap<String, String>();

			public void init(){

			users.put("kobe","denshi");
			users.put("osaka","castle");
			users.put("kyoto","gion");
			}

			@Override
			public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

					doPost(request, response);

				}
				@Override
			public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

			String userid=request.getParameter("userid");
			String password=request.getParameter("password");

			if(userid !=null && password !=null && password.equals(users.get(userid))){

			request.setAttribute("userid",userid);
			ServletContext application =this.getServletContext();

			RequestDispatcher disp =application.getRequestDispatcher("/servlet/account");
			disp.forward(request,response);

			}else{

			RequestDispatcher disp =request.getRequestDispatcher("login.html");
			disp.forward(request,response);
			}
			}


}
