<%-- 
    Document   : addTopic
    Created on : Apr 24, 2017, 11:12:32 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Description: Game of Quiz -->
<!-- Author: Eileen Kho, Leslie Ling, Ting Lee Ting -->
<!-- Last update: 2017-->
    
<title>JSP Page</title>
<meta name="viewport" content="width=device-width, initialscale=1.0"/>
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

<link href="frameworks/css/bootstrap.min.css" rel="stylesheet" />   
<!-- StyleSheet -->
<link href="frameworks/css/style.css" rel="stylesheet" />
<!-- StyleSheet -->
<link href="languages.min.css" rel="stylesheet" />
    

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
        <%!
            Connection conn;
            PreparedStatement pstmt;
            String qry;
        %>
        
        <%-- CREATE function--%>
        <%
            if(request.getParameter("btnAdd") != null){
                try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
               
                qry = "INSERT INTO quiz(quizTopic, bonus) VALUES(?,?)";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1,request.getParameter("txtName"));
                pstmt.setString(2,request.getParameter("txtBonus"));
                pstmt.executeUpdate();
                response.sendRedirect("./index.html");
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }  
            }
        %>
    <div class="container">
        <div class="row"><!--1--> 
            <div class="col-xs-12"><!--1.1--> 
                <img src="resources/img/banner.jpg" alt="banner" />
            </div>
            
        </div>
        
        
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Game Of Quizs </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav ">
                    <li><a href="index.html">Home / </a></li>
                    <li class="active" ><a href="#">Add Topic<span class="sr-only">(current)</span></a></li>
                    
                    
                  </ul>
                  
                  <ul class="nav navbar-nav navbar-right">
                      <form class="navbar-form navbar-left" role="search" id="icon" name="cse" action="http://www.google.com/search" target="_blank">
                    <table>
                        <tr>
                            <td>
                                <input type="hidden" name="ie" value="utd-8">
                                <input class="form-control" type="text" name="q" size="20" maxlength="255" placeholder="Google site search">
                                <input type="submit" value="Go!" class="btn btn-primary">
                            </td>
                        </tr>
                    </table>
                  </form>
                    <li><a href="#">Back to EQUILIBRA</a></li>
                  </ul>
                </div>
              </div>
            </nav>
        
        <div class="row"><!--3--> 
            <div class="col-xs-12 col-md-12 col-lg-12"><!--3.1--> 
                <center>
                <h1>Add New Topic</h1>
                <form id="addForm" action="" method="POST">  
                <ul>
                    <li class="questioncontainer"><h2>New Topic:</h2> </li>
                    <li class="container2"><input type="text" name="txtName" id="txtName" size="70%"/></li>
                    <li class="questioncontainer"><h2>Topic Bonus:</h2> </li>
                    <li class="container2"><textarea name="txtBonus" id="txtBonus"></textarea></li>
                    
                    <li><input type="submit" name="btnAdd" value="Add Topic" id="btnAdd" size="70%"/></li>
                    <li><a class="btn btn-primary" href="index.html">Cancel</a></li>
                </ul>
                </form>
                </center>
            </div>
        </div>
    </div>
<!-- jQuery – required for Bootstrap's JavaScript plugins -->
<script src="frameworks/js/jquery.min.js"></script>

<!-- All Bootstrap plug-ins file -->
<script src="frameworks/js/bootstrap.min.js"></script>
    
<!-- Basic AngularJS-->
<script src="frameworks/js/angular.js"></script>
        
<!-- Angular-route-->
<script src="frameworks/js/angular-route.min.js"></script>   

<!-- Config-->
<script src="frameworks/js/gameOQ.js"></script>  
</body>
</html>
