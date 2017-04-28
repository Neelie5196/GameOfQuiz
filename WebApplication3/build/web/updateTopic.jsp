<%-- 
    Document   : updateTopic
    Created on : Apr 25, 2017, 12:23:34 AM
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
<link href="style.css" rel="stylesheet" />
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
            Statement stmt;
            ResultSet result;
            String qry;
            Integer quizID;
        %>
        <%-- READ function--%>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
                stmt=conn.createStatement();
                qry = "SELECT * FROM quiz";
                result = stmt.executeQuery(qry);
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            }
        %>
        <%-- UPDATE function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("btnUpd")!=null){
                quizID = Integer.parseInt(request.getParameter("hiddenId"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "UPDATE quiz SET quizTopic = ?, bonus = ? WHERE quizID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1, request.getParameter("txtName1"));
                pstmt.setString(2, request.getParameter("txtName2"));
                pstmt.setInt(3, quizID);
                pstmt.executeUpdate();
                response.sendRedirect("./index.html");
                
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }
            }
            
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                quizID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "SELECT * FROM quiz WHERE quizID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1,quizID);
                result = pstmt.executeQuery();
                result.first();
                
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                } 
            }else{
                response.sendRedirect("./index.html");
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
                            <input type="text"   name="q" size="20" maxlength="255" value="Google site search">
                            <input type="submit" value="Go!">
                        </td>
                    </tr>
                </table>
		</form>
            </div>       
        </div>
        <h1>Update Topic & Topic Bonus</h1> 
        <div class="row"><!--3--> 
            <div class="col-xs-12 col-md-12 col-lg-12"> <!--3.1 --> 
                <div class="row">
                    <div class="col-xs-6 col-md-6 col-lg-6">
                       <table>
                           <caption>(Original)</caption>
                            <tr>
                                <td>Topic <%=quizID%>: </td>
                                <td><%=result.getString("quizTopic")%></td>
                            </tr>
                            <tr>  
                                <td>Topic Bonus: </td>
                                <td><%=result.getString("bonus")%></td>
                            </tr>    
                        </table> 
                    </div>
                    <div class="col-xs-6 col-md-6 col-lg-6">
                        <form id="updForm" action="" method="POST">
                        <table>
                            <caption>(Update here)</caption>
                            <tr>
                                <td>Topic: </td>
                                <td>
                                    <input type="hidden" name="hiddenId" id="hiddenId" value="<%=quizID%>"/>
                                    <input type="text" name="txtName1" id="txtName" placeholder="<%=result.getString("quizTopic")%>"/>
                                </td>
                            </tr>
                            <tr>  
                                <td>Topic Bonus: </td>
                                <td><textarea name="txtName2" id="txtName" placeholder="<%=result.getString("bonus")%>"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" name="btnUpd" placeholder="Update Employee" id="btnUpd"/></td>
                            </tr>     
                        </table>
                        </form> 
                    </div>
                </div> 
            <a href="index.html">Return</a>
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
