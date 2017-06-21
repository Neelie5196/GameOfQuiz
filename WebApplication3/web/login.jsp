<%-- 
    Document   : login
    Created on : Jun 13, 2017, 7:43:12 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>

<meta charset="UTF-8">       
<!-- Description: Game of Quiz -->
<!-- Author: Eileen Kho, Leslie Ling, Ting Lee Ting -->
<!-- Last update: 2017-->
    
<title>Game of Quiz</title>
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
        PreparedStatement pstmt,pstmt1;
        Statement stmt;
        ResultSet result;
        String qry;
        String username;
        
    %>

    <%-- login function--%>    
    <%
        String username = request.getParameter("username");    
        String password = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root", "");
        stmt = conn.createStatement();
        result = stmt.executeQuery("select * from admin where username='" + username + "' and password='" + password + "'");
        if (result.next()) {
            username = result.getString("name");
    %>

    <div class="container">   
    <div class="row"><!--1--> 
        <!-- tab -->
        <div class="col-xs-2 col-md-2 col-lg-2 tab"><!--1.1--> 
            <div id="circle">
                <a href="" id="profile"><%=result.getString("name")%></a>
            </div>
            
            <a href="#video" class="tabselect">Videos</a>
            <a href="#quiz" class="tabselect">Quizzes</a>
            <a href="#reward" class="tabselect">Rewards</a>
        </div>
    <%
        }else {
            out.println("Invalid password");
            response.sendRedirect("index.html");
        }
    %> 
            
        <div class="col-xs-10 col-md-10 col-lg-10"><!--1.2--> 
            <!-- navigation -->
            <div class="row">
                <div class="col-xs-12 col-md-12 col-lg-12">
                    <img src="resources/img/banner.jpg" alt="banner" />
                    <nav class="navbar navbar-default">
                    <div class="container-fluid">
                    <div class="navbar-header">
                        <p class="navbar-brand">Welcome Back <%=result.getString("name")%> !!!</p>
                    </div>
    
                    <div class="navbar-header"> 
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-to-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button> 
                    </div>
        
                    <div class="navbar-collapse collapse" id="navbar-to-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="">Athena</a></li>
                            <li>
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
                            </li> 
                            <li><a href='index.html'>Log out</a></li>
                        </ul>  
                    </div>        
                    </div>
                    </nav>
                </div>
            </div>
          <!-- content --> 
            <div class="row"><!--1--> 
                <div class="col-xs-12 col-md-12 col-lg-12"> 
                    <div class="tabcontent"><!--2.2--> 
                        <div data-ng-view></div>
                    </div>
                </div>
            </div>   
        </div>
    </div>

    <!-- footer -->
    <div class="row"><!--2--> 
        <div class="col-xs-12 col-md-12 col-lg-12"><!--2.1-->
            <hr/>
            <p> &copy; Last updated 2017</p>
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

<!-- Configuration -->
<script src="frameworks/js/gameOQ.js"></script>  

</body>
</html>
