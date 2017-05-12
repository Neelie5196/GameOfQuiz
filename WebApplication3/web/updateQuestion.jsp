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
            Integer z=0;
            Integer quizID;
        %>
        
        <%-- READ function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
 
            
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                quizID = Integer.parseInt(request.getParameter("quiz"));
                questionID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "SELECT * FROM question WHERE questionID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1,questionID);
                result = pstmt.executeQuery();
                result.first();
                z++;
                
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            } 
            }else{
                response.sendRedirect("./question.jsp?id=" + quizID);
            }
        %>
        
        <%-- UPDATE function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("btnUpd")!=null){
                questionID = Integer.parseInt(request.getParameter("hiddenId"));
                
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "UPDATE question SET question = ?, hints= ?, input1= ?, input2= ?, input3= ?, input4= ?, checked= ?, explanation= ? WHERE questionID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1,request.getParameter("txtquestion"));
                pstmt.setString(2,request.getParameter("txthints"));
                pstmt.setString(3,request.getParameter("txtinput1"));
                pstmt.setString(4,request.getParameter("txtinput2"));
                pstmt.setString(5,request.getParameter("txtinput3"));
                pstmt.setString(6,request.getParameter("txtinput4")); 
                pstmt.setString(7,request.getParameter("txtchecked"));
                pstmt.setString(8,request.getParameter("txtexplain"));
                pstmt.setInt(9, questionID);
                pstmt.executeUpdate();
                response.sendRedirect("./question.jsp?id=" + quizID);
                return;
                
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
                response.sendRedirect("./question.jsp?id=" + quizID);
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
                      <li><a href="question.jsp?id=<%=quizID%>">Question List / </a></li>
                    <li class="active" ><a href="#">Update Question<span class="sr-only">(current)</span></a></li>
                    
                    
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
        <div class="row update"><!--3--> 
            <div class="col-xs-10 col-md-10 col-lg-10"><!--3.1-->
                
                <h1>Update Topic <%=result.getInt("quizID")%> Question <%=result.getInt("questionID")%></h1> 
                <i>Press "Save" to commit and "Cancel to return to previous page</i>
                
            </div>
            <div class="col-xs-2 col-md-2 col-lg-2"><!--3.2-->    
                <button data-toggle="modal" data-target="#note" class="pull-right btn btn-warning">Note*</button>
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
            </div>
        </div>
<hr/>
        <div class="row"><!--4--> 
            <div class="col-xs-12 col-md-6 col-lg-6"><!--4.1-->
                <p class="right">(Original)</p>

                <!--display quiz question-->
                <div id="<%=result.getInt("questionID") %>" class="questioncontainer">
                    <h2> Question <% out.println(z); %></h2> <hr/>
                    <h3><%=result.getString("question") %></h3>
                </div>

                <div class="container2">
                <!-- Format for multiple choice -->
                <div data-ng-if="'<%=result.getString("type")%>' === 'M'">
                    <ul class="answercontainer">
                        <li class="rowinput" ><%=result.getString("input1") %></li>
                        <li class="rowinput" ><%=result.getString("input2") %></li>
                        <li class="rowinput" ><%=result.getString("input3") %></li>
                        <li class="rowinput" ><%=result.getString("input4") %></li>
                    </ul>
                </div>

                <!-- Format for Fill in the Blank -->
                <div data-ng-if="'<%=result.getString("type")%>' === 'B'">
                    <ul class="choice answercontainer">
                        <li>
                            <span><%=result.getString("input1") %></span>
                            <span class="tab"><%=result.getString("input2") %></span>
                            <span class="tab"><%=result.getString("input3") %></span>
                            <span class="tab"><%=result.getString("input4") %></span>
                        </li>
                    </ul>
                </div>

                <!-- Show hint-->
                <span class="hinticon glyphicon glyphicon-search"></span><b>Hint:</b> <%=result.getString("hints") %>           

                <!-- Show answer -->
                <div class="checkshowanswer">
                    <b>Answer: </b> <%=result.getString("checked")%><br/>
                    <b>Explanation in detail:</b> <%=result.getString("explanation")%>
                </div>
                </div>         
                </div>
            
            <div class="col-xs-6 col-md-6 col-lg-6 border"><!--4.2-->
                <p>(Update here)</p>
                <form id="updForm" action="" method="POST">
                    <ul>
                        <li><input type="hidden" name="hiddenId" id="hiddenId" value="<%=questionID%>"/> </li>

                        <li><h4>Question</h4></li>
                        <li><textarea name="txtquestion" class="form-control" placeholder="<%=result.getString("question") %>" cols="70"></textarea></li>
                        
                        <!-- Format for multiple choice -->
                        <div data-ng-if="'<%=result.getString("type")%>' === 'M'">        
                            <li><h4>Multiple choice</h4></li>
                            <li>
                                <input type="text" class="form-control" name="txtinput1" placeholder="A. <%=result.getString("input1") %>" size="70"/>
                                <input type="text" class="form-control" name="txtinput2" placeholder="B. <%=result.getString("input2") %>" size="70"/>
                                <input type="text" class="form-control" name="txtinput3" placeholder="C. <%=result.getString("input3") %>" size="70"/>
                                <input type="text" class="form-control" name="txtinput4" placeholder="D. <%=result.getString("input4") %>" size="70"/>
                            </li>
                        </div>
                    
                        <!-- Format for fill in the blank -->
                        <div data-ng-if="'<%=result.getString("type")%>' === 'B'">        
                            <li><h4>Choices for blank</h4></li>
                            <li >
                                <input type="text" class="form-control" name="txtinput1" placeholder="<%=result.getString("input1") %>" size="70"/>
                                <input type="text" class="form-control" name="txtinput2" placeholder="<%=result.getString("input2") %>" size="70"/>
                                <input type="text" class="form-control" name="txtinput3" placeholder="<%=result.getString("input3") %>" size="70"/>
                                <input type="text" class="form-control" name="txtinput4" placeholder="<%=result.getString("input4") %>" size="70"/>
                            </li>
                        </div>
                        
                        <!-- Format for true/false -->
                        <div data-ng-if="'<%=result.getString("type")%>' === 'T'">        
                            <li><h4>True / False</h4></li>
                            <li> 
                                <input type="hidden" class="form-control" name="txtinput1" placeholder="<%=result.getString("input1") %>" size="70"/>
                                <input type="hidden" class="form-control" name="txtinput2" placeholder="<%=result.getString("input2") %>" size="70"/>
                                <input type="hidden" class="form-control" name="txtinput3" placeholder="<%=result.getString("input3") %>" size="70"/>
                                <input type="hidden" class="form-control" name="txtinput4" placeholder="<%=result.getString("input4") %>" size="70"/>
                            </li>
                        </div>
                            
                        <li><h4>Hints</h4><input type="text" name="txthints" class="form-control" placeholder="<%=result.getString("hints") %>" size="70"/></li>

                        <li><h4>Answer</h4><input type="text" name="txtchecked" class="form-control" placeholder="<%=result.getString("checked") %>" size="70"/></li>
                        
                        <li><h4>Explanation</h4></li>
                        <li><input type="text" name="txtexplain" class="form-control" placeholder="<%=result.getString("explanation") %>" size="70"/></li>
                        
                        <li><button class="btn btn-primary" type="submit" name="btnUpd" id="btnUpd">Update Question</button></li>
                        <li><a class="btn btn-primary" href="question.jsp?id=<%=quizID%>">Cancel</a></li>
                    </ul>
              <!-- maybe add reset?-->
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
