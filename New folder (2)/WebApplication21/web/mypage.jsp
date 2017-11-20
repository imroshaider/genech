

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>マイページ</title>

	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	
</head>
<body>

	<div class="header">
	 <h1 class="text-center">ログイン後のページ</h1>
	</div>

	<div class="container">
	<div class="row">
	
	 <div class="col-md-3"><center>
	  プロフィール</br>
	  <img src="img/00.jpg" class="img-circle" width="100%" height="100%"></br>
	  user name</br>
	  <a href="profile.jsp">設定変更画面へ</a></br>
	  あと何か</br>
	  メニュー的な</br>
	  履歴的な</br>
	 </center></div>
	 <div class="col-md-9">
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
</body>
</html>