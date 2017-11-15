<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import="mvc.Database.DBConnection"%>
<%@page import="mvc.login.Loginservlet"%>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>マイページ</title>


	<link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/m_box.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <link href="css/img.css" rel="stylesheet">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
				<script src="js/mypage.js"></script>

</head>
<body>
<div class="container">
	<div class="row">


	<div class="page-header">

	 </div>

	</br>
    <%
       Blob img = null;
       byte[ ] imgData = null ;
//        LoginBean mypage= new LoginBean();
//String id= mypage.getUserid();

          String a = (String)session.getAttribute("userid");

    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from userprof where ID='"+a+"'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
     String nishi=x.getString("name");
img=x.getBlob("image");
imgData = img.getBytes(1,(int)img.length());
FileOutputStream fo = new FileOutputStream("C:\\apache-tomcat-8.5.16\\webapps\\pbl3\\web\\Image\\himu11.jpg");
fo.write(x.getBytes("image"));



      %>
    <div class="col-xs-6 col-md-2"><center>
	  <img src="Image/himu11.jpg" class="img-circle img1"></br>
	  name:imros</br>
	  		<form action="profile.jsp" method="post">
		<input type="submit" value="profile" class="btn btn-default" />
		</form>
	 <form action="Logoutservlet" method="post">
	 <input type="submit" value="Logout" class="btn btn-default" />
	 </form>
		 </div>

	 </center></div>


    <!-- リアルタイム -->
     <div class="col-md-6">

         <div class="col-sm-6">
        <br>

      <div class="panel panel-warning">
             <div class="panel-body"><div class="media">

                 <a class="media-left" href="#">
                 </a>

                 <div class="media-body">
                <h4 class="media-heading">
                                      <!--↓pop up-->
          <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#Modal_1">
                             企業名
                            </button>
                        <!-- モーダル・ダイアログ -->
                            <div class="modal fade" id="Modal_1" tabindex="-1">
                            <div class="modal-dialog">
                            <div class="modal-content">
                               <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                                </div>
                            <div class="modal-body">
                              <div class="box3">
                                <table class="teble text-left"> <!-- thの中にデータいれる -->
                                <tr><th>企業名：</th><th></th></tr>
                                <tr><th>コメント：</th><th></th></tr>
                                <tr><th>評価：</th><th></th></tr>
                                </table>
                              </div>

                            </div>
<!--                            <div class="modal-footer">
                            <button type="button" class="btn btn-primary">提案</button>
                            </div>-->
                            </div>
                    </div>
                    </div></h4>
                     行き先：<br>
                     IN：<br>
                     OUT：<br>
                     料金：
      </div>
      </div>

      <div class="panel-footer text-right">
          <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#Modal_2">
                             プラン詳細
                            </button>
                        <!-- モーダル・ダイアログ -->
                            <div class="modal fade" id="Modal_2" tabindex="-1">
                            <div class="modal-dialog">
                            <div class="modal-content">
                               <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                                </div>
                            <div class="modal-body">
                              <div class="box3">
                               <table class="teble text-left">  <!--thの中にデータいれる -->
                                <tr><th>住所：</th><th></th></tr>
                                <tr><th>趣味：</th><th></th></tr>
                                <tr><th>過去の訪問：</th><th></th></tr>
                                <tr><th>コメント：</th><th></th></tr>                                <br>
                                </table>
                              </div>

                            </div>
                            <div class="modal-footer">
                              <form action="">
                                <button type="button" class="btn btn-primary">提案</button>
                              </from>
                            </div>
                            </div>
                    </div>
                    </div>

       </div>

  </div>
                  </div>
   </div>
</div>
    <!--リアルタイム部分最後-->

<div class="col-xs-6 col-md-4 bg-warning">
   <form action="KibouServlet" method="POST" onsubmit="return false">
	 <div class="form-group">
    <label class="control-label">目的地①：</label>
    <select class="form-control" style="width:120px;" name="Des1">
    <option value="area_null">希望なし</option>
    <option value="osaka">大阪府</option>
    <option value="kyoto">京都府</option>
    <option value="hyogo">兵庫県</option>
    <option value="shiga">滋賀県</option>
    <option value="wakayama">和歌山県</option>
    </select>
</div>
<div class="form-group">
	<label class="control-label">目的地②：</label>
	<select class="form-control" style="width:120px;" name="Des2">
	<option value="area_null">希望なし</option>
	<option value="osaka">大阪府</option>
	<option value="kyoto">京都府</option>
	<option value="hyogo">兵庫県</option>
	<option value="shiga">滋賀県</option>
	<option value="wakayama">和歌山県</option>
	</select>
</div>
<div class="form-group">
	<label class="control-label">目的地③：</label>
	<select class="form-control" style="width:120px;" name="Des3">
	<option value="area_null">希望なし</option>
	<option value="osaka">大阪府</option>
	<option value="kyoto">京都府</option>
	<option value="hyogo">兵庫県</option>
	<option value="shiga">滋賀県</option>
	<option value="wakayama">和歌山県</option>
	</select>
</div>
  <div class="form-group">
    <label class="control-label">予算：</label>
    <select class="form-control" style="width:120px;" name="Cost">
      <option value="cost_null">希望なし</option>
      <option value="6000">～6000円</option>
      <option value="8000">～8000円</option>
      <option value="10000">～10000円</option>
      <option value="15000">～15000円</option>
      <option value="20000">20000円～</option>
    </select>
  </div>
        <label class="control-label">希望：</label>
         <input type="textarea" name="Hope">
   <div class="form-group">
     <label class="control-label">日程：</label>
     <p>
     チェックイン：<input type="date" class="form-control" name="CheckIn"></p>
     <p>
     チェックアウト：<input type="date" class="form-control" name="Chekout"></p>
  　</div>

    <div Align="right">
     <input type="button" value="送信" class="btn btn-default" onclick="putMessage('送信しました')" />
    </div>
   </form>
	 <p id="message01" ></p>
 </div>

 </div>

</div>

                      <%  fo.close();
  }
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
</body>
</html>
