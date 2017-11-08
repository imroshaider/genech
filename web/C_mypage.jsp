<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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


    }
</style>
</head>
<body>

	<div class="page-header text-center">
	 <h1>Mypage</h1>
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
			<div class="col-sm-6">
				<br>
			<div class="panel panel-primary">
			       <div class="panel-body"><div class="media">

			           <a class="media-left" href="#">
			           </a>

			           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
			               <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
			               <p>場所:大阪府　予算:20000～</p>
			               <p>IN:2017/12/4 16:00<br>
			               OUT:2017/12/5 13:00</p>
			           </div>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
			    <div align="left"><strong>5</strong>件の企業が提案</div>
			    <input type="submit" value="提案" id="plan" name="plan" class="btn btn-primary">
			　</from>
			</div>
			</div>
			</div>


			<div class="col-sm-6">
			<br>
			<div class="panel panel-primary">
			       <div class="panel-body"><div class="media">

			           <a class="media-left" href="#">
			           </a>

			           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
			               <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
			               <p>場所:兵庫県　予算:20000～</p>
			               <p>IN:2017/12/3 16:00<br>
			               OUT:2017/12/5 13:00</p>
			           </div>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
			    <div align="left"><strong>10</strong>件の企業が提案</div>
			    <input type="submit" value="提案" id="plan" name="plan" class="btn btn-primary">
			　</from>
			</div>
			</div>
			</div>

	 </div>

   <!-- 以下提案済みタブ -->
	 <div class="tab-pane" id="tab2">
	 	<br><br>
			<div class="col-sm-6">
				<br>
			<div class="panel panel-primary">
						 <div class="panel-body"><div class="media">

								 <a class="media-left" href="#">
								 </a>

								 <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
										 <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
										 <p>場所:和歌山県　予算:30000～</p>
										 <p>IN:2017/12/6 16:00<br>
										 OUT:2017/12/7 13:00</p>
								 </div>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
					<div align="left"><strong>5</strong>件の企業が提案</div>
					<input type="submit" value="提案済" id="plan" name="plan" class="btn btn-success">
			　</from>
			</div>
			</div>
			</div>


			<div class="col-sm-6">
			<br>
			<div class="panel panel-primary">
						 <div class="panel-body"><div class="media">

								 <a class="media-left" href="#">
								 </a>

								 <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
										 <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
										 <p>場所:兵庫県　予算:15000～</p>
										 <p>IN:2017/12/2 16:00<br>
										 OUT:2017/12/3 13:00</p>
								 </div>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
					<div align="left"><strong>10</strong>件の企業が提案</div>
					<input type="submit" value="提案済" id="plan" name="plan" class="btn btn-success">
			　</from>
			</div>
			</div>
			</div>
	 </div>
	 </div>
    </div>

	<div class="col-md-3">
		ranking
	</div>

	</div>
	</div>

<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
