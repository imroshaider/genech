/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.sentaku;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import mvc.Database.DBConnection;
import mvc.mail.sendMail;
import mvc.mypage.MypageBean;
import mvc.teian.TeianDao;

/**
 *
 * @author imros
 */
public class SentakuDao {
 public String Sentakuupdate(SentakuBean sentakuDao) throws IOException
{
    
    

String hopeid= sentakuDao.getHopeid();
String uname = sentakuDao.getUname();
String Uid = sentakuDao.getUid();
String Cid = sentakuDao.getCid();
String payment = sentakuDao.getPayment();
String paid = sentakuDao.getPaid();
String email="";
String subject="hello";
String naiyou="hello hello";
String sentaku="YES";



    Connection con = DBConnection.createConnection();
 PreparedStatement preparedStatement = null;
     try
        {
            
            String query = "UPDATE  temppalan SET sentaku=? where ID='"+hopeid+"'"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            
            preparedStatement.setString(1,sentaku);
             preparedStatement.executeUpdate();
             } catch (SQLException ex) {
        Logger.getLogger(TeianDao.class.getName()).log(Level.SEVERE, null, ex);
    }
 try{
     System.out.println("Uid is "+Uid);
 String quer="select * from user where ID='"+ Uid +"'";
  preparedStatement = con.prepareStatement(quer);
     ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
     email=x.getString("Mail");
 }
 }catch(SQLException e)
{
e.printStackTrace();
}
 
 sendMail send=new sendMail();
 send.Sendemail(email, subject, naiyou);
 
try
{
String query = "insert into pselect(HopeID,UID,UName,CID,Payment,paid) values (?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
preparedStatement = con.prepareStatement(query); 

preparedStatement.setString(1, hopeid);
preparedStatement.setString(2, Uid);
preparedStatement.setString(3, uname);
preparedStatement.setString(4, Cid);
preparedStatement.setString(5, payment);
preparedStatement.setString(6, paid);


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