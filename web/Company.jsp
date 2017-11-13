<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <meta charset="utf-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	 <title>JSP Page</title>

	 <!-- Bootstrap -->
	 <link href="css/bootstrap.min.css" rel="stylesheet">
	 <link href="css/login.css" rel="stylesheet">
    </head>
    <body>
	    <div class="container">
        <div class="row">
         <br>
        </div>

        <div class="row row-eq-height">
        
        <div class="col-md-6 col-md-offset-3 bg-warning">
        <h1 class="text-center">登録画面</h1>
        <table class="table">
        <thead>
         <tr><th>*のついた項目は入力必須</th><th></th></tr>
        </thead>
        <form method="POST" action="ProfileservletCompany">
           <tr><th>*Email</th><th><input type="text" name="Email"></th></tr>
           <tr ><th>*Name</th><th><input type="text" name="Name"></th></tr>
           <tr ><th>*Pass</th><th><input type="text" name="Pass"></th></tr>
           <tr ><th>*Re-Pass</th><th><input type="text" name="Pass"></th></tr>
           <tr ><th>*Address</th><th><input type="text" name="Address"></th></tr>
           <tr ><th>*Code</th><th><input type="text" name="Code"></th></tr>
           <tr ><th>URL</th><th><input type="text" name="Url"></th><br>
           <th><input type="submit" value="登録" class="btn btn-default"></th></tr>
        </form>
        </table>
        </div>
        
        </div>
        
        <div class="row">
        <br>
        </div>
        
        </div>
    </body>
</html>