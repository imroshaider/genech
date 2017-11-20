package mvc.minishop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import java.util.List;
import java.util.ArrayList;

public class ItemDAO{
	
	Context ctx= null;
	DataSource ds=null;
	Connection con=null;
	PreparedStatement ps =null;
	ResultSet rs= null;

	public ItemDAO(){
	try{
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/minishop");
			con=ds.getConnection( );
	}catch(Exception e){
			e.printStackTrace();

	}

	}
		public List<ItemBean> selectItems(String genre){

		List<ItemBean> items = new ArrayList<ItemBean>();
		String strSql="";
		try{
				strSql="select * from items where genre= ?";
				ps=con.prepareStatement(strSql);
				ps.setString(1, genre);
				rs=ps.executeQuery();
				while(rs.next()){

				ItemBean itemBean= new ItemBean();
				itemBean.setIdent(rs.getInt("ident"));
				itemBean.setName(rs.getString("name"));
				itemBean.setMaker(rs.getString("maker"));
				itemBean.setPrice(rs.getInt("price"));
				itemBean.setImage(rs.getString("image"));
				itemBean.setGenre(rs.getString("genre"));
				items.add(itemBean);
		}		
		}catch(SQLException e){
			System.out.println(e.getMessage());
		
		} catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
		try {
		    if(rs !=null)rs.close();
		    if(ps !=null)ps.close();
		    if(con !=null)con.close();		
		}catch (Exception e){
					System.out.println(e.getMessage());
		}	finally{
				return items;
		}
}
}
}