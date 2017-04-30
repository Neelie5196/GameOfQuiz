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
            <div class="col-xs-12 col-md-12 col-lg-12 jumbotron"><!--1.1--> 
                <img src="resources/img/banner.jpg" alt="banner"/>
            </div>
        </div>
        
        <div class="row"  id="navigationbar"> <!--2--> 
            <div class="col-md-8 col-md-push-1" id="breadcrumb"> <!--2.1--> 
                <a href="#home">Home</a>
            </div>
            
            <div class="col-md-2 col-md-push-1 col-md-pull-1" id="toequilibra"><!--2.2--> 
                <a href="#home">back to EQUILIBRA</a>
                
                <!-- Code for google search engine is refered from "https://www.google.com/cse/tools/create_onthefly"-->      
                <form id="icon" name="cse" action="http://www.google.com/search" target="_blank">
                <table>
                    <tr>
                        <td>
                            <input type="hidden" name="ie" value="utd-8">
                            <input type="text" name="q" size="20" maxlength="255" value="Google site search">
                            <input type="submit" value="Go!">
                        </td>
                    </tr>
                </table>
		</form>
            </div>       
        </div>
        
        <div class="row"><!--3--> 
            <div class="col-xs-12 col-md-12 col-lg-12"><!--3.1--> 
                <h1>Add New Topic</h1>
                <form id="addForm" action="" method="POST">
                    <table cellspacing="5" cellpadding="5">
                        <tbody>
                            <tr>
                                <td>New Topic: </td>
                                <td><input type="text" name="txtName" id="txtName"/></td>
                            </tr>
                            <tr>
                                <td>Topic Bonus: </td>
                                <td><textarea name="txtBonus" id="txtBonus"></textarea></td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="btnAdd" value="Add Topic" id="btnAdd"/></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
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
