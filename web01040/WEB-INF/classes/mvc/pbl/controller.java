package mvc.minishop;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import java.util.ArrayList;

public class ItemController extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{

	doPost(request,response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");

			String dispatcherURL = "register.html";
			
			HttpSession session=request.getSession();
			synchronized(session){
			if(process == null || process.equals("")){
			dispatcherURL = "index.jsp";
			}else if(process.equals("select")){
				String genre=request.getParameter("genre");
				ItemDAO itemDAO = new ItemDAO();
				session.setAttribute("items",itemDAO.selectItems(genre));
				dispatcherURL="select.jsp";
			}else if(process.equals("detail")){
				int ident=Integer.parseInt(request.getParameter("ident"));
				setItembean(ident, session);
				dispatcherURL="detail.jsp";
			}else if(process.equals("returnselect")){
				dispatcherURL="select.jsp";
			}else if(process.equals("addBasket")){
				int quantity =Integer.parseInt(request.getParameter("quantity"));
				this.addBasket(quantity,session);
				dispatcherURL=("basket.jsp");
			}else if(process.equals("change")){
				int number = Integer.parseInt(request.getParameter("number"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				ItemBasketBean itemBasketBean = (ItemBasketBean)session.getAttribute("itemBasketBean");
				itemBasketBean.changeItemQuantity(number,quantity);
				dispatcherURL="basket.jsp";

			}else if(process.equals("delete")) {
				int number = Integer.parseInt(request.getParameter("number"));
				ItemBasketBean itemBasketBean = (ItemBasketBean)session.getAttribute("itemBasketBean");
				itemBasketBean.deleteItem(number);
				dispatcherURL="basket.jsp";
			}
			request.getRequestDispatcher(dispatcherURL).forward(request,response);
			}

	}
	private void setItembean(int ident, HttpSession session){
		ItemBean itemBean = new ItemBean();
		List<ItemBean> items = (ArrayList<ItemBean>)session.getAttribute("items");
		for(int i=0; i<items.size();i++){
			itemBean = items.get(i);
			if(ident==itemBean.getIdent()){
				session.setAttribute("itemBean",itemBean);
				break;
			}
		}
	}

	private void addBasket(int quantity, 	HttpSession session){
		ItemBean itemBean =(ItemBean)session.getAttribute("itemBean");
		ItemBasketBean itemBasketBean =(ItemBasketBean)session.getAttribute("itemBasketBean");

		boolean duplicateFlag = false;
		if(itemBasketBean  == null){
			itemBasketBean = new ItemBasketBean();
			session.setAttribute("itemBasketBean",itemBasketBean);
		}else{
			for(int i=0; i<itemBasketBean.getSize();i++){
				if(itemBean.getIdent() == itemBasketBean.getItem(i).getIdent()){
					itemBasketBean.changeItemQuantity(i, quantity);
					duplicateFlag=true;
					break;
				}
			}
		}
		if(duplicateFlag == false){
			itemBasketBean.setBasket(itemBean, quantity);
		}
		}
	}
	


