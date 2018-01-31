
package mvc.teian;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import mvc.Database.DBConnection;
import mvc.teian.TeianBean;

/**
 *
 * @author imros
 */
public class TeianDao {
    
public String teianupdate(TeianBean teianBean){
    
        Calendar cal=Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
        String Cid=teianBean.getCid();
        String CName=teianBean.getCName();
        String UName = teianBean.getuName();
        String Uid=teianBean.getUid();
        String Des1 =teianBean.getDes1();
        String Cost =teianBean.getCost();
        String Detail =teianBean.getDetail();
        String Hotel =teianBean.getHotel();
        String People =teianBean.getPeople();
        String CheckIn =teianBean.getCheckIn();
        String Checkout =teianBean.getCheckout();
        String Vehocle = teianBean.getVehocle();
        String uuid=teianBean.getUuid();
        Integer count=0;
        String zikan;
        String sentaku="NO";
         String feedback="NO";
        zikan=sdf.format(cal.getTime())+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE)+"-"+cal.get(Calendar.HOUR_OF_DAY)+"-"+cal.get(Calendar.MINUTE);
        
        Integer  Kcount= 1;
        
        Connection con = DBConnection.createConnection();
       
        PreparedStatement preparedStatement = null;
         try {
        String quer = "select * from travelsearch where Uid='"+uuid+"'";
        preparedStatement = con.prepareStatement(quer);
        ResultSet y =preparedStatement.executeQuery();
        
       
            while(y.next()){
                Kcount += y.getInt(count);
            }  } catch (SQLException ex) {
                Logger.getLogger(TeianDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        try
        {
            
            String query = "UPDATE  travelsearch SET count=? where Uid='"+uuid+"'"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            
            preparedStatement.setInt(1,Kcount);
             preparedStatement.executeUpdate();
             } catch (SQLException ex) {
        Logger.getLogger(TeianDao.class.getName()).log(Level.SEVERE, null, ex);
    }
     try {        
            String query1 = "insert into temppalan(Cid,Uid,CName,UName,Des1,Cost,Hotel,zikan,CheckIn,Checkout,people,count,detal,vehicle,sentaku,feedback) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query1);
            
//Making use of prepared statements here to insert bunch of data

preparedStatement.setString(1, Cid);
preparedStatement.setString(2, Uid);
preparedStatement.setString(3, CName);
preparedStatement.setString(4, UName);
preparedStatement.setString(5, Des1);
preparedStatement.setString(6, Cost);
preparedStatement.setString(7, Hotel);
preparedStatement.setString(8, zikan);
preparedStatement.setString(9,CheckIn );
preparedStatement.setString(10, Checkout);
preparedStatement.setString(11, People);
preparedStatement.setInt(12, count);
preparedStatement.setString(13, Detail);
preparedStatement.setString(14, Vehocle);
preparedStatement.setString(15, sentaku);
preparedStatement.setString(16, feedback);
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