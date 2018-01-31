
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
<%@page import="mvc.New"%>
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
<!-- menu -->
   <div class="col-md-3">
    menu
<ul class="nav nav-pills nav-stacked">
 <li class="active"><a href="#">管理画面</a></li>
  <li><a href="C_profile.jsp">企業詳細変更</a></li>
  <li><a href="#">企業詳細閲覧</a></li>
    <li><a href="index.jsp">Logout</a></li>
</ul>
<!-- メニュー用（後で使います）
  <div class="tab-content">
  <div class="tab-pane active" id="tab1">Tab1 Content</div>
  <div class="tab-pane" id="tab2">Tab2 Content</div>
  <div class="tab-pane" id="tab3">Tab3 Content</div>
</div>-->
   </div>

  <div class="col-md-6">
    <ul class="nav nav-tabs">
          <li class="nav-item">
           <a href="#tab1" class="nav-link navbar-primary bg-primary active" data-toggle="tab">新着</a><!-- tab1 -->
          </li>
          <li class="nav-item">
           <a href="#tab2" class="nav-link navbar-primary bg-primary" data-toggle="tab">提案済</a><!-- tab2 -->
          </li>
      </ul>

  <div class="tab-content">
      
      
        <!-- tab1 新着タブ最初 -->
    <div class="tab-pane active" id="tab1">
        <br><br><br>
              
         <!--↓pop up-->

            <%
                String address="";
                String hoby="";
                String hope="";
                String id="";
     response.setIntHeader("Refresh", 20);
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from travelsearch where count ='0' order by Uid desc";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
                          hope=x.getString("Hope");
                           
                         
                                %>
                                       
  <div class="col-sm-6">
             <div class="panel panel-primary">
             <div class="panel-body"><div class="media">

                 <a class="media-left" href="#">
                 </a>

                 <div class="media-body">
                <h4 class="media-heading">
                    
                <!-- ユーザー情報 -->
                                <%
                                    out.println("<form action='#Modal_1' method=''>");
            out.println("<input type='hidden' name='himu' value='" +  x.getString("ID") + "'>");
                 out.println("<input type='hidden' name='uid' value='" +  x.getString("Uid") + "'>");
                 out.println("<input type='hidden' name='hope' value='" +  x.getString("Hope") + "'>");
           out.println("<input type='submit' value='user名'  class='btn btn-primary btn-lg' data-toggle='modal' data-target='#Modal_1'>");
            out.println("</form>");
        
                                              
                    out.println("<h4 class='media-heading'>" + x.getString("Name") +"</h4>");
                    out.println("<p>場所:" + x.getString("Des1") + "</p>");
                    out.println("<p>人数:" + x.getString("people") + "</p>");
                    out.println("<p>IN:" + x.getString("CheckIn") + "</p>");
                    out.println("<p>OUT:" + x.getString("Checkout") + "</p>");
                    
       out.println("</div></div><div class='panel-footer text-right'>");
                      out.println("<form method='POST' action='temp.jsp' >");
                       out.println("<div align='left'><strong>5</strong>件の企業が提案</div>");
                       out.println("<input type='hidden' name='uid' value='" +  x.getString("Uid") + "'>");
                        out.println("<input type='hidden' name='userid' vvalue='" +  x.getString("ID") + "'>");
                       out.println("<input type='hidden' name='username' value='" +  x.getString("Name") + "'>");
          out.println("<input type='submit' value='提案' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#Modal_2'>");
                             
                           

     out.println("</form>");
                                       %>
       </div>

  </div>
                  </div>
   </div>
 <% }


 }
      catch(SQLException e)
{
e.printStackTrace();
};
        %>

  </div>
<!--    </div> 新着タブ最後? -->
    <!-- 新着タブ最後 -->
    
    
    <!-- 提案済タブ最初 -->
    <div class="tab-pane" id="tab2" name="tab2">
        <br><br><br>
        
    <!-- 提案済みタブ 
    <center>
    <iframe src="C_tab2.jsp" frameborder="1" width="550" height="500">
        ここにC_tab2.jspの情報がでる
    </iframe>
    </center>
   提案済みタブ最後 -->
    
 <%
               
     response.setIntHeader("Refresh", 20);
    
      try{
          String query = "select * from travelsearch where count !='0' order by Uid desc";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
                          hope=x.getString("Hope");
                           
                         
                                %>
                                
  
  <!-- C_tab2.jspに↓の部分を反映させたい -->
  <div class="col-sm-6">
                                 <div class="panel panel-primary">
             <div class="panel-body"><div class="media">

                 <a class="media-left" href="#">
                 </a>

                 <div class="media-body">
                <h4 class="media-heading">
                    
          
                                <%
                                    out.println("<form action='#Modal_1' method=''>");
            out.println("<input type='hidden' name='himu' value='" +  x.getString("ID") + "'>");
                 out.println("<input type='hidden' name='uid' value='" +  x.getString("Uid") + "'>");
                 out.println("<input type='hidden' name='hope' value='" +  x.getString("Hope") + "'>");
           out.println("<input type='submit' value='user名'  class='btn btn-primary btn-lg' data-toggle='modal' data-target='#Modal_1'>");
            out.println("</form>");
        
                                              
                                    out.println("<h4 class='media-heading'>" + x.getString("Name") +"</h4>");
                                    out.println("<p>場所:" + x.getString("Des1") + "</p>");
                                    out.println("<p>人数:" + x.getString("people") + "</p>");
                                    out.println("<p>IN:" + x.getString("CheckIn") + "</p>");
                                    out.println("<p>OUT:" + x.getString("Checkout") + "</p>");
                    
       out.println("</div></div><div class='panel-footer text-right'>");
                      out.println("<form method='POST' action='temp.jsp' >");
                       out.println("<div align='left'><strong>5</strong>件の企業が提案</div>");
                       out.println("<input type='hidden' name='uid' value='" +  x.getString("Uid") + "'>");
                        out.println("<input type='hidden' name='userid' vvalue='" +  x.getString("ID") + "'>");
                       out.println("<input type='hidden' name='username' value='" +  x.getString("Name") + "'>");
          out.println("<input type='submit' value='提案' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#Modal_2'>");
                             
                           

     out.println("</form>");
                                       %>
       </div>

  </div>
                  </div>
   </div>
 <% }


 }
      catch(SQLException e)
{
e.printStackTrace();
};
        %>


      </div>
        
  
        
 <div class="modal fade" id="Modal_1" tabindex="-1">
                            <div class="modal-dialog">
                            <div class="modal-content">
                               <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                                </div>
                            <div class="modal-body">
                        <%
                            out.println("<div class='box2'><span class='box-title'>User Name</span>");  
                            out.println("<table class='teble text-left'>");
                                 
                            String himu=request.getParameter("himu");
                            String rumi=request.getParameter("uid");
                            String hopee=request.getParameter("hope");
                            String query1 = "select name,address,post,keep,past from userprof where ID='"+himu+"'";
                            preparedStatement = con.prepareStatement(query1);
                            ResultSet y =preparedStatement.executeQuery();
                            
            while(y.next()){
                            out.println("<form action='temp.jsp' method='post'>");
                            out.println("<input type='hidden' name='uid' value='" +rumi + "'>");
                            out.println("<input type='hidden' name='userid' value='" +himu + "'>");
                            out.println("<input type='hidden' name='username' value='" +y.getString("name") + "'>");
                            String addresss=y.getString("post");
                            addresss+=y.getString("address");
                            String keepp=y.getString("keep");
                            String past=y.getString("past");
                            out.println("<tr><th>住所:"+addresss +"</th><th></th></tr>");
                            out.println(" <tr><th>趣味："+ keepp +"</th><th></th></tr>");
                            out.println("<tr><th>過去の訪問："+past+"+</th><th></th></tr>");
                            out.println("<tr><th>コメント："+ hopee +"</th><th></th></tr>");   
                            out.println("<br></table></div>");
                        }       
                                %>                       
                                
</div>
                            <div class="modal-footer">
                                
                             <input type="submit" value="提案" class="btn btn-primary">
                             </form>
                                    
                            </div>
                            </div>
                    </div>
                    </div>
    </div>
    <!-- 提案済タブ最後 -->
    
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
