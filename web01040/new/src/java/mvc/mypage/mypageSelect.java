
package mvc.mypage;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import mvc.Database.DBConnection;
import mvc.mypage.MypageBean;
public class mypageSelect {
  
 public  List<String>  rankList,rankList1= new ArrayList<String>();
public List<String> mypageselect() throws SQLException{
  
   
    MypageBean mypage= new MypageBean();
String id= mypage.getId();
System.out.println(id);
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from userprof where ID='"+id+"'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();
 while(x.next()){
     
      rankList.add(x.getString("ID"));
      rankList.add(x.getString("name"));
      rankList.add(x.getString("sex"));
      rankList.add(x.getString("age"));
      rankList.add(x.getString("keep"));
      rankList.add(x.getString("post"));
      rankList.add(x.getString("address"));
      
    

 }
 return rankList;
      }
      catch(SQLException e)
{
e.printStackTrace();
}
     return rankList;



}   


 
}
