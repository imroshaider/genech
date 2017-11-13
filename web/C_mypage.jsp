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
	<title>My Page</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<link href="css/m_box.css" rel="stylesheet">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
        <style type="text/css">
    .tab-box{
        padding: 20px;
        border: 1px solid #DDD;
        border-top: 0;
    }
    .tab-box > h3{
        margin:20px 0;
        font-style:italic;
    }
    .tab-box > p{
        line-height: 2;
        color: #919191;
}



</style>
</head>
<body>

	<div class="page-header text-center">
	 <h1>EasyTravel</h1>
	</div>

	<div class="container">
	<div class="row">

	<div class="col-md-3">
		menu
	</div>

	<div class="col-md-6">
		<ul class="nav nav-tabs">
      		<li class="nav-item">
      		 <a href="#tab1" class="nav-link navbar-primary bg-primary active" data-toggle="tab">新着</a>
      		</li>
      		<li class="nav-item">
      		 <a href="#tab2" class="nav-link navbar-primary bg-primary" data-toggle="tab">提案済</a>
      		</li>
    	</ul>

	<div class="tab-content">
           <!-- 以下新着タブ -->
            <div class="tab-pane active" id="tab1">
	 	<br><br>

            <%
     response.setIntHeader("Refresh", 20);
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from travelsearch where count ='0' order by zikan desc";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){ %>
                        <div class="col-sm-6">
				<br>

			<div class="panel panel-primary">
			       <div class="panel-body"><div class="media">

			           <a class="media-left" href="#">
			           </a>

			           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
			          <h4 class="media-heading">user名</h4>
                                       <%
                                          out.println("<h4 class='media-heading'>" + x.getString("Name") +"</h4>");
                                        out.println("<p>場所:" + x.getString("Des1") + "</p>");

			              out.println("<p>IN:" + x.getString("CheckIn") + "</p>");
                                      out.println("<p>OUT:" + x.getString("Checkout") + "</p>");
			              %>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
			    <div align="left"><strong>5</strong>件の企業が提案</div>
                            <!--↓pop up-->
			    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#sampleModal">
                             詳細
                            </button>
                        <!-- モーダル・ダイアログ -->
                            <div class="modal fade" id="sampleModal" tabindex="-1">
                            <div class="modal-dialog">
                            <div class="modal-content">
                               <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                                </div>
                            <div class="modal-body">
                              <div class="box2">
                              <span class="box-title">User Name</span>
                                <table class="teble text-left"> <!-- thの中にデータいれる -->
                                <tr><th>住所：</th><th></th></tr>
                                <tr><th>趣味：</th><th></th></tr>
                                <tr><th>過去の訪問：</th><th></th></tr>
                                <tr><th>コメント：</th><th></th></tr>																<br>
                                </table>
                              </div>

                            </div>
                            <div class="modal-footer">
														<button type="button" class="btn btn-primary">提案</button>
                            </div>
                            </div>
                    </div>
                    </div>
			　</from>

			 </div>

	</div>
                  </div>
	 </div>
 <% }


 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>

	</div>
            <div class="tab-pane active" id="tab2" name="tab2">
	 	<br><br>

            <%
     response.setIntHeader("Refresh", 20);
//     Connection con = DBConnection.createConnection();
//    PreparedStatement preparedStatement = null;
      try{
          String query = "select Name from travelsearch where count=!'0' order by zikan desc";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){ %>
                        <div class="col-sm-6">
				<br>

			<div class="panel panel-primary">
			       <div class="panel-body"><div class="media">

			           <a class="media-left" href="#">
			           </a>

			           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
			          <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
                                       <%
                                          out.println("<h4 class='media-heading'>" + x.getString("Name") +"</h4>");
                                        out.println("<p>場所:" + x.getString("Des1") + "</p>");

			              out.println("<p>IN:" + x.getString("CheckIn") + "</p>");
                                      out.println("<p>OUT:" + x.getString("Checkout") + "</p>");
			              %>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
			    <div align="left"><strong>5</strong>件の企業が提案</div>

			　</from>

			 </div>

	</div>
                  </div>
	 </div>
 <% }


 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>


</div>

      </div>
        </div>
        </div>
        </div>
        <div class="col-md-3">
		ranking
	</div>




<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
