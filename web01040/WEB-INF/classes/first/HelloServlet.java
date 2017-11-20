package first;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HelloServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();



	out.println("<!DOCTYPE html>");
	out.println("<html lang=ja>");
	out.println("<head><meta charset=UTF-8>");
	out.println("<title>はじめとのServlet</title>");
	out.println("<body>");
	out.println("Hello,Servlet");
	out.println("</body>");
	out.println("</html>");


	}
}