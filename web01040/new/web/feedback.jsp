<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="mvc.Companypage.ProfileservletCompany"%>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>レビュー</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/p_1.css" rel="stylesheet">
  <link href="css/feed.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

  <div class="page-header">
     <h1 class="text-center">レビュー</h1>
	</div>

	<div class="container">
	<div class="row row-eq-height">

	<div class="col-md-4">

</div>


  <div class="col-md-3 text-warning">
   <div class="form-header">
   </div>
   <div class="form">
    <form name="form" action="FeedbackServlet" method="post" >
    <input type="hidden" value="<%= request.getParameter("ID") %>" name="ID">");
    <input type="hidden" value="<%= request.getParameter("Cid") %>" name="Cid">");
    <input type="hidden" value="<%= request.getParameter("Uid") %>" name="Uid">");
      <div class="form-group">
       <p><label for="f_plan">プランの内容について</label></p>
       <div class="hyouka">
            <input id="fp_1" type="radio" name="fp" value="5" />
            <label for="fp_1">★</label>
            <input id="fp_2" type="radio" name="fp" value="4" />
            <label for="fp_2">★</label>
            <input id="fp_3" type="radio" name="fp" value="3" />
            <label for="fp_3">★</label>
            <input id="fp_4" type="radio" name="fp" value="2" />
            <label for="fp_4">★</label>
            <input id="fp_5" type="radio" name="fp" value="1" />
            <label for="fp_5">★</label>
        </div>
       </div>

        <div class="form-group">
            <p><label for="f_company">企業の対応について</label></p>
              <div class="hyouka">
                <input id="fc_1" type="radio" name="fc" value="5" />
                <label for="fc_1">★</label>
                <input id="fc_2" type="radio" name="fc" value="4" />
                <label for="fc_2">★</label>
                <input id="fc_3" type="radio" name="fc" value="3" />
                <label for="fc_3">★</label>
                <input id="fc_4" type="radio" name="fc" value="2" />
                <label for="fc_4">★</label>
                <input id="fc_5" type="radio" name="fc" value="1" />
                <label for="fc_5">★</label>
              </div>
        </div>
       
          <div class="form-group">
              <p class="control-label"><label for="f_use">次回も利用したいですか？</label></b></p>
      <div class="radio-inline">
        <input type="radio" value="1" name="use" id="hai">
          <label for="hai">はい</label>
      </div>
      <div class="radio-inline">
        <input type="radio" value="2" name="use" id="iie">
        <label for="iie">いいえ</label>
      </div>
    </div>

        <div class="form-group">
            <p><label for="f_comment">comment</label></p>
            <textarea name="f_comment" class="form-control" style="width:300px; height:100px;"  placeholder="コメント" rows="1" maxlength="500"></textarea>
            <small class="form-text text-muted">500文字以内</small>
    	</div>

      <div Align="left">
          <input type="hidden" name="process" value="chenge">
       <input type="submit" value="Update" name="update"  class="btn btn-warning">
      </div>
        <br>
      </form>
   </div>
  </div>


  </div>
</div>

</body>
</html>
