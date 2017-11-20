<%--
    Document   : newjsp
    Created on : Oct 2, 2017, 1:37:19 PM
    Author     : imros
--%>
<%@page language="java" contentType="text/html; charset=utf-8"%>

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

		<div class="page-header">

		</div>

		 <div class="col-xs-6 col-md-2"><center>
		  <img src="img/00.jpg" class="img-circle img1"></br>
		  name:神戸デンコ</br>
			 <div>
			<form action="profile.jsp" method="post">
			<input type="submit" value="profile" class="btn btn-default" />
			</form>
			 <form action="logoutservlet" method="post">
			 <input type="submit" value="Logout" class="btn btn-default" />
			 </form>
			 </div>
		 </center></div>


	 <div class="col-xs-6 col-md-6">
	  <form action="" method="GET">
	   <div class="form-group">
	    <label class="control-label">希望結果</label><br />
	   </div>
	    <div class="form-group">
	     <label class="form-label">4件</label><br />
		 </div>
		 <div class="col-sm-6">
			 <div class="panel panel-warning">
				 <div class="panel-heading strong">食べ歩きプラン</div>
					 <div class="panel-body">評価:★★★★☆</div>
						<ul class="list-group">
	       		<li class="list-group-item">料金:8,000円~</li>
						<li class="list-group-item">兵庫県神戸市元町</li>
	       		<li class="list-group-item"><a href="">詳細はこちら</a></li>
	   				</ul>
			 </div>
		 </div>
		 	<div class="col-sm-6">
			 	<div class="panel panel-warning">
				 <div class="panel-heading strong">異人館観光<<素泊まり>></div>
					 <div class="panel-body">評価:★★★☆☆</div>
					 <ul class="list-group">
					 <li class="list-group-item">料金:6,000円~</li>
					 <li class="list-group-item">兵庫県神戸市中央区2-10</li>
					 <li class="list-group-item"><a href="">詳細はこちら</a></li>
					 </ul>
			 </div>
		 </div>
     <br>
       <div class="col-sm-6">
         <div class="panel panel-warning">
          <div class="panel-heading strong">アパアパホテル</div>
            <div class="panel-body">評価:★★★☆☆</div>
            <ul class="list-group">
            <li class="list-group-item">料金:9,000円~</li>
            <li class="list-group-item">大阪府大阪市西区土佐堀1-1-1</li>
            <li class="list-group-item"><a href="">詳細はこちら</a></li>
            </ul>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="panel panel-warning">
         <div class="panel-heading strong">帝國ホテル</div>
           <div class="panel-body">評価:★★★★☆</div>
           <ul class="list-group">
           <li class="list-group-item">料金:9,000円~</li>
           <li class="list-group-item">大阪府大阪市北区天満橋</li>
           <li class="list-group-item"><a href="">詳細はこちら</a></li>
           </ul>
       </div>
     </div>
	  </form>

	</div>

  <div class="col-xs-6 col-md-4 bg-warning">
   <form action="" method="POST">
     <div class="form-group">
         <label class="control-label">目的地①：</label>
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
     	<label class="control-label">目的地②：</label>
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
     	<label class="control-label">目的地③：</label>
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
</body>
</html>
