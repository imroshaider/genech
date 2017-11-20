package beans;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class IteeBean implements Serializable {

	private int ident;
	private String classification;
	private String mnemonic;
	private String english_name;
	private int rank;
	private String target;

	private Context ctx= null;
	private DataSource ds =null;
	private Connection con =null;
	private PreparedStatement  ps = null;
	private ResultSet rs= null;

	public void IteeBean(){

	}
	public void setIdent(int ident){
		this.ident= ident;
	}
	public void setClassification(String classification){
		this.classification= classification;
	} 
	public void setMnemonic(String mnemonic){
		this.mnemonic= mnemonic;
	} 
	
	
	public void setEnglish_name(String english_name){
		this.english_name= english_name;
	} 
	public void setRank(int rank){
		this.rank= rank;
	} 
		public void setTarget(String target){
		this.target= target;
	} 
	public int getIdent(){
		return this.ident;
	}
	public String getClassification(){
		return this.classification;
	}
	public String getMnemonic(){
		return this.mnemonic;
	}
	public String getEnglish_name(){
		return this.english_name;
	}
	public int getRank(){
		return this.rank;
	}
	public String getTarget(){
		return this.target;
	}
	public void dbSelect(int ident){
		try{
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/itee");
			con=ds.getConnection();
			String strSql = "select * from examination where ident =?";
			ps = con.prepareStatement(strSql);
			
			ps.setInt(1,ident);
			rs =ps.executeQuery();
			if(rs.next()){
				this.ident=ident;
				this.classification=rs.getString("classification");
				this.mnemonic=rs.getString("mnemonic");
				this.english_name=rs.getString("english_name");
				this.rank=rs.getInt("rank");
				this.target=rs.getString("target");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs !=null) rs.close();
				if(ps !=null) ps.close();
				if(con !=null) con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}