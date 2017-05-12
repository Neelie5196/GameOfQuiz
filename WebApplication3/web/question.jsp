<%-- 
    Document   : question
    Created on : Apr 25, 2017, 10:48:31 PM
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
            Connection conn;
            PreparedStatement pstmt;
            ResultSet result;
            String qry;
            Integer quizID;
            
        %>
        
        <%-- READ function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                quizID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "SELECT * FROM question WHERE quizID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1,quizID);
                result = pstmt.executeQuery();
                
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
        <center>
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
            <div class="col-xs-12 col-md-12 col-lg-12"> <!--3.1 -->
                <div class="panel panel-default">
                <div class="panel-heading"> <h1>Question List</h1></div>
                <div class="table-responsive">
                <table class="table table-stripped table-hover" data-ng-controller="more">
                    <thead>
                        <tr>
                            <th id="no" scope="col" >No.</th>
                            <th id="quez" scope="col" >Question</th>
                            <th id="typeq" scope="col" >Type</th>
                            <th id="more" scope="col">Show More</th>
                            <th id="edit" scope="col" >Edit</th>
                            <th id="delete" scope="col" >delete</th>
                        </tr>
                    </thead>                      
                    <tbody>      
                        <%
                            while(result.next()) {
                                quizID = result.getInt("quizID");
                        %>

                        <tr>
                            <td headers="no"><%=result.getInt("questionID") %></td>
                            <td headers="quez"><%=result.getString("question") %></td>
                            <td headers="typeq"><%=result.getString("type") %></td>
                            <td headers="more"><a class="glyphicon glyphicon-eye-open" href="showQuestion.jsp?id=<%=result.getInt("questionID")%>"></a></td>
                            <td headers="edit"><a class="glyphicon glyphicon-edit" href="updateQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>"></a></td>
                            <td headers="del"><a class="glyphicon glyphicon-trash" href="deleteQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>" onclick="return confirm('Once confirm, question <%=result.getString("questionID") %> will be removed. Confirm to delete?')"></a></td>
                        </tr>

                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6">
                                <a class="glyphicon glyphicon-plus-sign" href="addQuestion.jsp?id=<%=quizID%>">ADD</a>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                </div>
                </div>
                    
                <p><a href="index.html">Back To Topic</a></p> 
            </div>
        </div>
        </center>
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
