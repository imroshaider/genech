/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.kibou;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.Database.DBConnection;
import mvc.kibou.KibouBean;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import mvc.Database.DBConnection;
/**
 *
 * @author imros
 */


public class KibouDao{
public String kibouupdate(KibouBean kibouBean) throws IOException
{
     Calendar cal=Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
    
  String ID = kibouBean.getId();
  String Des1 = kibouBean.getDes1();
  String Des2 = kibouBean.getDes2();
  String Des3 = kibouBean.getDes3();
  String Cost = kibouBean.getCost();
  String CheckIn =kibouBean.getCheckIn();
  String Checkout = kibouBean.getCheckout();
  String Hope = kibouBean.getHope();
  String Name=null;
  String zikan;
  zikan=sdf.format(cal.getTime())+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE)+"-"+cal.get(Calendar.HOUR_OF_DAY)+"-"+cal.get(Calendar.MINUTE);
        
 

try
{
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
    String name="SELECT Name FROM userprof WHERE ID='"+ID+"'";
    preparedStatement = con.prepareStatement(name);
  ResultSet x =preparedStatement.executeQuery();
 while(x.next()){
       Name =x.getString("name");
 }

String query = "insert into travelsearch(ID,Name,Des1,Des2,Des3,Cost,Hope,zikan,CheckIn,Checkout) values (?,?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
preparedStatement = con.prepareStatement(query); 

//Making use of prepared statements here to insert bunch of data
preparedStatement.setString(1, ID);
preparedStatement.setString(2, Name);
preparedStatement.setString(3, Des1);
preparedStatement.setString(4, Des2);
preparedStatement.setString(5, Des3);
preparedStatement.setString(6, Cost);
preparedStatement.setString(7, Hope);
preparedStatement.setString(8, zikan);
preparedStatement.setString(9,CheckIn );
preparedStatement.setString(10, Checkout);


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