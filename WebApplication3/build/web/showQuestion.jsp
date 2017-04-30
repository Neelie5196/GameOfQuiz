<%-- 
    Document   : showQuestion
    Created on : Apr 27, 2017, 4:09:42 PM
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
            ResultSet result;
            String qry;
            Integer questionID;
        %>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
 
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                questionID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "SELECT * FROM question WHERE questionID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1,questionID);
                result = pstmt.executeQuery();
                result.first();
                
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            } 
            }else{
                response.sendRedirect("./employees.jsp");
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
            <div class="col-xs-12 col-md-12 col-lg-12"> <!--3.1 --> 
                <i>press "Backspace" to return previous page</i>
                <h3>All about Question <%=result.getInt("questionID")%></h3> 
                <ul>
                    <li><b>Question:</b> <%=result.getString("question") %></li>
                    <li><b>Hints:</b> <%=result.getString("hints") %></li>
                    <li><b>Type:</b> <%=result.getString("type") %></li>
                    <li><b>Selection:</b></li>
                    <li>
                        <p><%=result.getString("input1") %></p>
                        <p><%=result.getString("input2") %></p>
                        <p><%=result.getString("input3") %></p>
                        <p><%=result.getString("input4") %></p>
                    </li>
                    <li><b>Answer</b>: <%=result.getString("checked") %></li>
                </ul>
                
                <a class="glyphicon glyphicon-edit" href="updateQuestion.jsp?id=<%=result.getInt("questionID")%>"></a>
                <a class="glyphicon glyphicon-trash" href="deleteQuestion.jsp?id=<%=result.getInt("questionID")%>" onclick="return confirm('Once confirm, question <%=result.getString("questionID") %> will be removed. Confirm to delete?')"></a>

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
