<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
　<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>モーダル</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/img.css" rel="stylesheet">
  <link href="css/p_1.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/common.css" media="all" />
  <link rel="stylesheet" type="text/css" href="css/layerBoard.css" media="all" />

  <!-- JavaScript -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <script src="js/jquery-cookie.js"></script>
  <script src="js/jquery.layerBoard.js"></script>
  <script>
  $(function(){

	   $('#layer_board_area').layerBoard({alpha:0.5});

   })
   </script>

</head>
<body>

    
  <div class="container">
  <div class="row row-eq-height">

  <!-- modal -->
<div id="layer_board_area">
	
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Forget Password</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <form role="form" action="ForgetServlet" method="Post">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> UserId</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter Userid">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Email</label>
              <input type="text" class="form-control" name="email" placeholder="Enter email">
            </div>
           
                <input type="submit" class="btn btn-success btn-block" value="Get Password" > <span class="glyphicon glyphicon-off"></span> 
          </form>
        </div>
        <div class="modal-footer">
            <a href="index.jsp" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</a>
          
        </div>
      </div>
      
    </div>

    <!-- panel -->

    
 
<!--    
		<p class="btn_close"><a href="mypage.jsp">close</a></p>
	</div>
</div>
 //modal 

  <div class="page-header">
     <h1 class="text-center">モーダル</h1>
	</div>-->



  


</div>
</div>

</body>
</html>
