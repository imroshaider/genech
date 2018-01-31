<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>プロフィール編集</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/img.css" rel="stylesheet">
  <link href="css/p_1.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

  <div class="page-header">
     <h1 class="text-center">プロフィール編集</h1>
	</div>

	<div class="container">
	<div class="row row-eq-height">

	<div class="col-md-3">
	<div class="form">

  <form name="form" action="Profileservlet" method="post" onsubmit="return validate()">
      
                
    <img src="Image/himu11.jpg" class="img-circle img1">
    <input type="file" name="image">
	
</div>
</div>


  <div class="col-md-4 text-warning">
   <div class="form-header">
   </div>
   <div class="form">
   
      <div class="form-group">
        <p><label for="id">User Name</label></p>
        <input type="text" class="form-control" name="username" style="width:200px;" rows="1" maxlength="14">
	<small class="form-text text-muted">8文字以内</small>
      </div>

        <div class="form-group">
          <label for="sex">Sex</label>
            <div class="radio-inline">
              <input type="radio" value="man" name="sex" ">
              <label for="man">男性</label>
            </div>
            <div class="radio-inline">
              <input type="radio" value="female" name="sex">
              <label for="woman">女性</label>
            </div>
        </div>
        <div class="form-group">
        <label for="age">Age</label>
        <input type="text" name="age" style="width:50px;" placeholder="年齢" maxlength="3">
        </div>
      
      <div class="form-group">
      <p><label for="keep">About yourSelf</label></p>
         <textarea class="form-control" style="width:300px;" name="keep" placeholder="趣味・好物...etc" rows="1" maxlength="100"></textarea>
        </div>
       
      <div class="form-group">
      <p><label for="visits">Past visits</label></p>
         <textarea class="form-control" style="width:300px;" name="past" placeholder="過去に旅行した場所" rows="1" maxlength="100"></textarea>
        </div>

       <div class="form-group">
    	<p><label for="post">Street address</label></p>
            <input type="text" name="post" class="form-control" style="width:150px;"  placeholder="郵便番号" rows="1" maxlength="7">	
            <br><textarea class="form-control" style="width:300px;" name="address" placeholder="住所" rows="1" maxlength="60"></textarea>
        </div>
       

      <div Align="right">
       <input type="submit" value="Update" name="update"  class="btn btn-warning">
      </div>
      </form>
   </div>
  </div>


  </div>
</left>
</div>
</div>
</div>

</body>
</html>
