<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv='Content-Style-Type' content='text/javascript'>
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>ログイン</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">

</head>

<body>

	<div class="page-header">
   	<div class="col-md-7 text-left">
	 <img src="img/logo.png" align="left">
 </div>
   <div align="left" class="form">
     <div class="form-inline">
    <form class="form-group" action="Loginservlet" method="POST">
    User ID
     <!--<p class="id">--><input type="text" class="form-control" name="userid" autocomplete="off" style="width:200px;" maxlength="30"/><!--</p>-->
    Password
        <!--<p class="pass">--><input type="password" class="form-control" name="password" style="width:200px;" maxlength="16"/><!--</p>-->
        <input type="submit" value="login" id="login" name="login" class="btn btn-warning"><br>
        <label class="check">
         <input type="checkbox" name="save" id="save" value="off" /><label for="save" >次回から自動ログインを許可する
        </label>
       </form>
     </div>
   </div>
	</div>

	<div class="container">
	<div class="row row-eq-height">

<!--サイト紹介部分-->
    <div class="col-md-7">

     <img src="img/neko.jpg" align="left" width="600" height="400">


  	 </div>


<!--サイト紹介部分最後-->



<!--登録部分-->
<div class="col-md-5 bg-warning text-center">
 <h1 class="text-center">Let's get started</h1><left>
   <div class="form border">
   <center>
     <form name="form" action="RegisterServlet" method="POST" onsubmit="return validate()">


     <div class="form-group">
       <p><label for="id">User ID</label></p>
       <input class="form-control" name="userid" style="width:200px;" rows="1" maxlength="14">
       <small class="form-text text-muted">14文字以内の英数字</small>
     </div>

     <div class="form-group">
       <p><label for="password">Password</label></p>
       <input type="password" class="form-control" style="width:200px;" name="pass" maxlength="16"><br>
       <input type="password" class="form-control" style="width:200px;" name="pass" maxlength="16">
       <small class="form-text text-muted">16文字以内の英数字</small>
     </div>

     <div class="form-group">
       <p><label for="email">Email</label><br></p>
       <input type="text" class="form-control" style="width:300px;" name="mail" maxlength="30">
       <small class="form-text text-muted">有効なメールアドレスを入力</small>
     </div>

   <a href="">利用規約</a>
    <div class="form-check">
      <label class="form-check-label">
      <input type="checkbox" class="form-check-input">
      同意する
    　　</label>
    　</div>
    <div Align="right">
    　<button type="submit" value="sign_up" id="sign_up" name="sign_up" class="btn btn-warning">SignUp</button>
    </div>
    </form></center>
 </left>
</div>
</div>
<!--登録部分最後-->

	 <div class="col-md-1">
	 </div>


	</div>

	</div>

</body>
</html>
