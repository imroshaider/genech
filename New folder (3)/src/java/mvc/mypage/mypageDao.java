package mvc.mypage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.Database.DBConnection;



public class mypageDao{
public String mypageupdate(MypageBean mypageBean) throws IOException
{
    
    
    FileInputStream fis=null;
String id=mypageBean.getId();
String username = mypageBean.getUsername();
String sex = mypageBean.getSex();
String age = mypageBean.getAge();
String keep = mypageBean.getKeep();
String post = mypageBean.getPost();
String address = mypageBean.getAddress();
String image = mypageBean.getImage();
String past = mypageBean.getPast();
String user=null;

  File imagee= new File("C:\\apache-tomcat-8.5.16\\webapps\\pbl3\\web\\Image\\" +image);

try
{
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
//    String y="SELECT ID FROM userprof WHERE ID='"+id+"'";
//    preparedStatement = con.prepareStatement(y);
//  ResultSet x =preparedStatement.executeQuery();
// while(x.next()){
//       user =x.getString("ID");
//       System.out.println("nishimo" + user +"nishimo");
//
// }
//
// if(id.equals(user)){
     
String query = "UPDATE  userprof SET name=?,age=?,sex=?,address=?,keep=?,image=?,post=?,past=? where ID='"+id+"'"; //Insert user details into the table 'USERS'
 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data

preparedStatement.setString(1, username);
preparedStatement.setString(2, age);
preparedStatement.setString(3, sex);
preparedStatement.setString(4, address);
preparedStatement.setString(5, keep);
fis=new FileInputStream(imagee);
preparedStatement.setBinaryStream(6, (InputStream) fis, (int) (imagee.length()));
preparedStatement.setString(7, post);
preparedStatement.setString(8, past);

int i=  preparedStatement.executeUpdate();




if (i!=0)  //Just to ensure data has been inserted into the database
return "SUCCESS"; 
}
//}
catch(SQLException e)
{
e.printStackTrace();
}


return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
}

    Object get(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}