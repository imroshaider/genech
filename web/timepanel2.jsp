<%@ page language="java" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>提案済</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/img.css" rel="stylesheet">

</head>

<body>
<div class="container">
	<div class="row">

	<div class="page-header">

    	 </div>


<div class="col-sm-3">
<div class="panel panel-primary">
       <div class="panel-body"><div class="media">

           <a class="media-left" href="#">
           </a>

           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
               <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
               <p>場所:和歌山県　予算:20000～</p>
               <p>チェックイン:2017/12/1 17:00<br>
               チェックアウト:2017/12/2 13:00</p>
           </div>
</div>
</div>
<div class="panel-footer text-right">
<form action="">
    <div align="left"><strong>13</strong>件の企業が提案</div>
    <input type="submit" value="提案済" id="plan" name="plan" class="btn btn-success">
　</from>
</div>
</div>
</div>


<div class="col-sm-3">
<div class="panel panel-primary">
       <div class="panel-body"><div class="media">

           <a class="media-left" href="#">
           </a>

           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
               <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
               <p>場所:青森県　予算:30000～</p>
               <p>チェックイン:2017/12/4 16:00<br>
               チェックアウト:2017/12/5 13:00</p>
           </div>
</div>
</div>
<div class="panel-footer text-right">
<form action="">
    <div align="left"><strong>20</strong>件の企業が提案</div>
    <input type="submit" value="提案済" id="plan" name="plan" class="btn btn-success"><!-- ボタンクリックしたら提案済みの内容を照会できるとか -->
    </from>
</div>
</div>
</div>

       </div>

        </div>

     </body>
     </html>
