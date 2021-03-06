<%-- 
    Document   : question
    Created on : Apr 29, 2017, 11:59:49 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html data-ng-app="myApp">
<head>
                
<!-- Description: Game of Quiz -->
<!-- Author: Eileen Kho, Leslie Ling, Ting Lee Ting -->
<!-- Last update: 2017-->
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            Connection conn,conn1;
            PreparedStatement pstmt,pstmt1;
            Statement stmt;
            ResultSet result;
            String qry,qry1;
            Integer videoID;
            Integer z = 0;  
        %>

        <%-- READ function for videos--%>
        <%
           try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
                stmt=conn.createStatement();
                qry = "SELECT * FROM video";
                result = stmt.executeQuery(qry);
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            }
        %>
        
    <div class="container">
        <div class="row"> 
            <div class="jumbotron"> 
                <p>EQUILIBRA</p>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-12 catbuttoncontainer">
                <button data-ng-click="biology=true; english=false" class="catbtn btn-lg">Biology</button>
                <button data-ng-click="english=true; biology=false" class="catbtn btn-lg">English</button>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-12" data-ng-show="biology">
                <h1>Biology</h1>
            </div>
            
            <div class="col-xs-12 col-md-12 col-lg-12" data-ng-show="english">
                <h1>English</h1>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-12" data-ng-show="biology">
                <%
                    while(result.next() && (result.getString("category").equalsIgnoreCase("biology"))) {
                %>
                
                <div class="row videocontainer">
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <h2><%=result.getString("videoName") %></h2>
                        </div>
                    </div>
                        
                    <div class="row">
                        <div class="col-xs-4 col-md-4 col-lg-4">
                            <video width="100%" height="100%" controls>
                                <source src="<%=result.getString("videoPath") %>" type="video/mp4">
                            </video>
                        </div>

                        <div class="col-xs-6 col-md-6 col-lg-6">
                            <p><%=result.getString("videoDesc") %></p>
                        </div>            

                        <div class="col-xs-2 col-md-2 col-lg-2 quizbtncont">
                            <a href="index.html"><button class="btn-lg btnplay">Create quiz</button></a>
                        </div>
                    </div>
                </div>
                <%
                        }
                %>
            </div>
            
            <div class="col-xs-12 col-md-12 col-lg-12" data-ng-show="english">
                <%
                    while(result.next() && (result.getString("category").equalsIgnoreCase("english"))) {
                %>
                
                <div class="row videocontainer">
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <h2><%=result.getString("videoName") %></h2>
                        </div>
                    </div>
                        
                    <div class="row">
                        <div class="col-xs-4 col-md-4 col-lg-4">
                            <video width="100%" height="100%" controls>
                                <source src="<%=result.getString("videoPath") %>" type="video/mp4">
                            </video>
                        </div>

                        <div class="col-xs-6 col-md-6 col-lg-6">
                            <p><%=result.getString("videoDesc") %></p>
                        </div>            

                        <div class="col-xs-2 col-md-2 col-lg-2 quizbtncont">
                            <a href="index.html"><button class="btn-lg btnplay">Create quiz</button></a>
                        </div>
                    </div>
                </div>
                <%
                        }
                %>
            </div>
        </div>
    </div>

<!-- jQuery – required for Bootstrap's JavaScript plugins) -->
<script src="frameworks/js/jquery.min.js"></script>

<!-- All Bootstrap plug-ins file -->
<script src="frameworks/js/bootstrap.min.js"></script>
    
<!-- Basic AngularJS-->
<script src="frameworks/js/angular.js"></script>
        
<!-- Angular-route-->
<script src="frameworks/js/angular-route.min.js"></script>   

<!-- Configuration-->
<script src="frameworks/js/gameOQ.js"></script>    
</body>
</html>




                            
                
                
                        
