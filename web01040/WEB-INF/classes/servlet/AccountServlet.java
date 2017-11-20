package servlet;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AccountServlet extends HttpServlet{
			
			Map<String, String[]> accountData = new HashMap<String, String[]>();

			public void init(){

			accountData.put("kobe",  new String[]{"神戸　電子", "kobe@denshi.net","神戸市中央区"});
			accountData.put("osaka", new String[]{"大阪 城","osaka@castle.net","大阪市中央区"});
			accountData.put("kyoto", new String[]{"京都 祇園","kyoto@gion.net","京都市中央区"});
			}

			@Override
			public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

					doPost(request, response);

				}

@Override
			public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

					String userid=(String)request.getAttribute("userid");

				if(userid !=null){
					String[] records =(String[])accountData.get(userid);
					request.setAttribute("records",records);
					ServletContext application =this.getServletContext();
					application.getRequestDispatcher("/servlet/account.jsp").forward(request,response);
				}else{
					request.getRequestDispatcher("login.html").forward(request,response	);

				}

				}
				
}