package mvc.bmi;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BMIController extends HttpServlet{
	String dispatcherURL=null;


	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

	doPost(request, response);
}

	@Override
			public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

				request.setCharacterEncoding("UTF-8");
				String process = request.getParameter("process");
				if(process == null || process.equals("")){
					dispatcherURL="/mvc/bmi/bmiform.html";
				}else if(process.equals("calc")){

					try{
						String name=request.getParameter("name");
						double height =Double.parseDouble(request.getParameter("height"));
						double weight =Double.parseDouble(request.getParameter("weight"));

						BMIBean bmiBean = new BMIBean();
						bmiBean.setName(name);
						bmiBean.setHeight(height);
						bmiBean.setWeight(weight);
						bmiBean.calcBMI();
						HttpSession session=request.getSession();
						session.setAttribute("bmiBean",bmiBean);
						dispatcherURL="/mvc/bmi/bmiresult.jsp";
					}catch(Exception e){
						dispatcherURL="/mvc/bmi/bmiresult.jsp";
					}
				}else if(process.equals("type")){
					dispatcherURL="bmitype.jsp";
				}

				request.getRequestDispatcher(dispatcherURL).forward(request,response);

}

}