<%-- 
    Document   : updateQuestion
    Created on : Apr 27, 2017, 12:21:45 PM
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
        <%-- READ function--%>
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
        <%-- UPDATE function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("btnUpd")!=null){
                questionID = Integer.parseInt(request.getParameter("hiddenId"));
                
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "UPDATE question SET question = ?, hints= ?, input1= ?, input2= ?, input3= ?, input4= ?, checked= ? WHERE questionID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1,request.getParameter("txtquestion"));
                pstmt.setString(2,request.getParameter("txthints"));
                pstmt.setString(3,request.getParameter("txtinput1"));
                pstmt.setString(4,request.getParameter("txtinput2"));
                pstmt.setString(5,request.getParameter("txtinput3"));
                pstmt.setString(6,request.getParameter("txtinput4")); 
                pstmt.setString(7,request.getParameter("txtchecked"));
                pstmt.setInt(8, questionID);
                pstmt.executeUpdate();
                response.sendRedirect("./question.jsp");
                
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            }
            }
            
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
        <i>press "Backspace" to return previous page</i>
        <h1>Update Topic <%=result.getInt("quizID")%> Question <%=result.getInt("questionID")%></h1> 
        
            <button data-toggle="modal" data-target="#note">Note*</button>
            <!-- Modal -->
            <div class="modal fade" id="note" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Rules</h4>
                </div>
                <div class="modal-body">
                    <p>I) This question will remain same format.</p><br/>
                    <p>II) It is compulsory to fill in all the blank if any changes made else do not click UPDATE button</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Understood</button>
                </div>
            </div>
            </div>
            </div>

        <div class="row update"><!--3--> 
            <div class="col-xs-12 col-md-6 col-lg-6 border"><!--3.1-->
                <p class="right">(Original)</p>
                <ul class="showforupdate">
                    <li><h3>Question</h3></li>
                    <li class="showdata"><%=result.getString("question") %></li>
                    <li><h3>Hints</h3></li>
                    <li class="showdata"><%=result.getString("hints") %></li>
                    <li><h3>Type:</h3></li>
                    <li class="showdata"><%=result.getString("type") %></li>
                    <li><h3>Selection</h3></li>
                    <li>
                        <p class="showdata"><%=result.getString("input1") %></p>
                        <p class="showdata"><%=result.getString("input2") %></p>
                        <p class="showdata"><%=result.getString("input3") %></p>
                        <p class="showdata"><%=result.getString("input4") %></p>
                    </li>
                    <li><h3>Answer</h3></li>
                    <li class="showdata"><%=result.getString("checked") %></li>
                </ul>        
            </div>
            
            <div class="col-xs-6 col-md-6 col-lg-6"><!--3.2-->
                <p>(Update here)</p>
                <form id="updForm" action="" method="POST">
                <table>
                    <input type="hidden" name="hiddenId" id="hiddenId" value="<%=questionID%>"/>    
                    <tr>
                        <td><h3>Question</h3></td>
                    </tr>
                    <tr>
                        <td><textarea name="txtquestion" class="form-control" placeholder="<%=result.getString("question") %>" cols="70"></textarea></td>
                    </tr>
                    <tr>
                        <td><h3>Hints</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="txthints" class="form-control" placeholder="<%=result.getString("hints") %>" size="70"/></td>
                        </td>
                    </tr>
                    <tr>        
                        <td><h3>Selection</h3></td>
                    </tr>
                    <tr> 
                        <td>
                            <input type="text" class="form-control" name="txtinput1" placeholder="<%=result.getString("input1") %>" size="70"/>
                            <input type="text" class="form-control" name="txtinput2" placeholder="<%=result.getString("input2") %>" size="70"/>
                            <input type="text" class="form-control" name="txtinput3" placeholder="<%=result.getString("input3") %>" size="70"/>
                            <input type="text" class="form-control" name="txtinput4" placeholder="<%=result.getString("input4") %>" size="70"/>
                        </td> 
                    </tr>
                    <tr>
                        <td><h3>Answer</h3></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="txtchecked" class="form-control" placeholder="<%=result.getString("checked") %>" size="70"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnUpd" value="Update Question" id="btnUpd"/></td>
                        <td><button type="button" href="topic.jsp">Cancel</button></td>
                    </tr>        
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

<!-- Configuration -->
<script src="frameworks/js/gameOQ.js"></script>    
</body>
</html>
