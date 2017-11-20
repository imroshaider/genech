<%@page contentType="text/html; charset=UTF-8"%>
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
  <link href="css/img.css" rel="stylesheet">

</head>
<body>
<div class="container">
	<div class="row">

	<div class="header">
	 <h1 class="text-center">ログイン後のページ</h1>
	 <div Align="right">
	 <form action="Logoutservlet" method="post">
	 <input type="submit" value="Logout" class="btn btn-default" />

	 </form>
	 </div>
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
FileOutputStream fo = new FileOutputStream("C:\\apache-tomcat-8.5.16\\webapps\\WebApplication2\\web\\Image\\himu1.jpg"); 
fo.write(x.getBytes("image"));



      %>
    <div class="col-xs-6 col-md-3"><center>
	  <img src="img/00.jpg" class="img-circle img1"></br>
	  <a href="profile.jsp">設定変更画面へ</a></br>
	  name:神戸デンコ</br>

	 </center></div>

	 <div class="col-xs-6 col-md-6">
	  <form action="" method="GET">
	   <div class="form-group">
	    <label class="control-label">検索結果</label><br />
	   </div>
	    <div class="form-group">
	     <label class="form-label">〇〇件</label><br />
		 </div>
		 <div class="col-sm-5">
			 <div class="panel panel-warning">
				 <div class="panel-heading strong">日帰り食べ歩きプラン</div>
					 <div class="panel-body">評価:★★★★☆</div>
						<ul class="list-group">
	       		<li class="list-group-item">料金:8,000円~</li>
						<li class="list-group-item">大阪府大阪市中央区道頓堀</li>
	       		<li class="list-group-item"><a href="">詳細はこちら</a></li>
	   				</ul>
			 </div>
		 </div>
		 	<div class="col-sm-5">
			 	<div class="panel panel-warning">
				 <div class="panel-heading strong">異人館観光<<素泊まり>></div>
					 <div class="panel-body">評価:★★★☆☆</div>
					 <ul class="list-group">
					 <li class="list-group-item">料金:6,000円~</li>
					 <li class="list-group-item">兵庫県神戸市中央区</li>
					 <li class="list-group-item"><a href="">詳細はこちら</a></li>
					 </ul>
			 </div>
		 </div>
	  </form>

	</div>

  <div class="col-xs-6 col-md-3 bg-warning">
   <form action="" method="POST">
    <div class="form-group">
    <label class="control-label">目的地：</label>
    <select class="form-control" style="width:120px;" id="destination">
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
    <select class="form-control" style="width:120px;" id="budget">
      <option value="cost_null">希望なし</option>
      <option value="6000">～6000円</option>
      <option value="8000">～8000円</option>
      <option value="10000">～10000円</option>
      <option value="15000">～15000円</option>
      <option value="20000">20000円～</option>
    </select>
  </div>
   <div class="form-group">
     <label class="control-label">日程：</label>
     <p>
     チェックイン：<input type="date" class="form-control" name="chekin"></p>
     <p>
     チェックアウト：<input type="date" class="form-control" name="chekout"></p>
  　</div>
    <div Align="right">
     <input type="submit" value="送信" class="btn btn-default" />
    </div>
   </form>
 </div>

 </div>

</div>
                   




	<!-- <div class="header">
	 <h1 class="text-center"><%= nishi %>ログイン後のページ</h1>
	</div> -->

	<!-- <div class="container">
	<div class="row"> -->
	
	 <!-- <div class="col-md-3"><center>
	  プロフィール</br>
	  <img src="Image\\himu1.jpg" class="img-circle" width="100%" height="100%"></br>
          
	  user name</br>
	  <a href="profile.jsp">設定変更画面へ</a></br>
	  あと何か</br>
	  メニュー的な</br>
	  履歴的な</br>
	 </center></div> -->
                      <%  fo.close();
  }
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
	 <!-- <div class="col-md-9">
	  <form action="" method="POST">
	   <div class="form-group">
	    <label class="control-label">このあたりに<input type="text" class="form-control" /></label><br />
	   </div>
	    <div class="form-group">
	     <label class="form-label">希望を出したい<input type="text" class="form-control"/></label><br />
	   <div Align="right">
	    <input type="submit" value="送信" class="btn btn-default" />
	   </div>
	  </form>
             
	 </div>
	
	</div>
		</div>
            
           <div>
                <form method="POST" action="Logoutservlet">
                 <input type="submit" value="BUTTON" />
            </div>
      --> 
</body>
</html>