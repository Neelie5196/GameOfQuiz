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
                        <li>
                            <input type="hidden" name="ie" value="uli-8">
                            <input type="text" name="q" size="20" maxlength="255" value="Google site search">
                            <input type="submit" value="Go!">
                        </li>
                    </tr>
                </table>
		</form>
            </div>       
        </div>
        <div class="row"><!--3--> 
            <div class="col-xs-10 col-md-10 col-lg-10"><!--3.1--> 
                <i>press "Backspace to return previous page"</i>
                <h1>Update Topic & Topic Bonus</h1>  
            </div>
            <div class="col-xs-2 col-md-2 col-lg-2"><!--3.2-->
                 <button data-toggle="modal" data-target="#note" class="right">Note*</button> 
                    <!-- Modal -->
                    <div class="modal fade" id="note" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Rules</h4>
                        </div>
                        <div class="modal-body">
                            <p>I) It is compulsory to fill in all the blank if any changes made else do not click UPDATE button</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Understood</button>
                        </div>
                    </div>
                    </div>
                    </div>
            </div>
        </div>
                    
        <div class="row update"><!--4--> 
            <div class="col-xs-12 col-md-6 col-lg-6 border"><!--4.1-->
                <p class="right">(Original)</p>
                <ul class="showforupdate">
                    <li><h3>Topic <%=quizID%></h3></li>
                    <li class="showdata"><%=result.getString("quizTopic")%></li>
                    <li><h3>Topic Bonus</h3></li>
                    <li class="showdata"><%=result.getString("bonus")%></li>
                </ul>    
            </div>
            <div class="col-xs-12 col-md-6 col-lg-6"><!--4.2-->
                <p>(Update here)</p>
                <form id="updForm" action="" method="POST">
                    <ul>
                        <li><h3>Topic <%=quizID%></h3></li>
                        <li>
                            <input type="hidden" name="hiddenId" id="hiddenId" value="<%=quizID%>"/>

                            <input type="text" name="txtName1" class="form-control" id="txtName" placeholder="<%=result.getString("quizTopic")%>" size="70"/>
                        </li>
                        <li><h3>Topic Bonus</h3></li>
                        <li><textarea name="txtName2" class="form-control" id="txtName" placeholder="<%=result.getString("bonus")%>" rows="3" cols="70"></textarea></li>
                        <li colspan="2"><button name="btnUpd" id="btnUpd"/>update</li>
                    </ul>
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

<!-- Configuration -->
<script src="frameworks/js/gameOQ.js"></script> 
</body>
</html>
