<%-- 
    Document   : addQuestion
    Created on : Apr 26, 2017, 11:04:21 PM
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
<link href="<%=request.getContextPath()%>/frameworks/css/bootstrap.min.css" rel="stylesheet" media="screen">

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
        
        <%-- CREATE function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("id") != null && request.getParameter("id")!= "" ){  
                quizID = Integer.parseInt(request.getParameter("id"));
                if(request.getParameter("btnAdd") != null){
                    try{
                        Class.forName("com.mysql.jdbc.Driver");

                        qry = "INSERT INTO question(quizID, question, type,hints, input1, input2, input3, input4, checked, explanation) VALUES(?,?,?,?,?,?,?,?,?,?)";
                        pstmt = conn.prepareStatement(qry);
                        pstmt.setInt(1, quizID);
                        pstmt.setString(2,request.getParameter("txtquestion"));
                        pstmt.setString(3,request.getParameter("txttype"));
                        pstmt.setString(4,request.getParameter("txthints"));
                        pstmt.setString(5,request.getParameter("txtinput1"));
                        pstmt.setString(6,request.getParameter("txtinput2"));
                        pstmt.setString(7,request.getParameter("txtinput3"));
                        pstmt.setString(8,request.getParameter("txtinput4")); 
                        pstmt.setString(9,request.getParameter("txtchecked"));
                        pstmt.setString(10,request.getParameter("txtexplain"));
                        
                        pstmt.executeUpdate();
                        response.sendRedirect("./question.jsp?id=" + quizID);
                    }catch(ClassNotFoundException cnfe){
                        out.println("Class not Found Execption:-" + cnfe.toString());
                    }catch(SQLException sqle){
                        out.println("SQL Query Exception:- " + sqle);
                    }
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
                    <li class="active" ><a href="#">Add Question<span class="sr-only">(current)</span></a></li>
                    
                    
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
                
                <h3 class="modal-title">Add New Question</h3>
                <i>Press "Save" to commit and "Cancel to return to previous page</i>
                <hr/>
                <form id="addForm" action="" method="POST">

                    <!--quiz question add here-->
                    <div class="questioncontainer">
                        <div class="row">
                        <div class="col-xs-4 col-md-4 col-lg-4 question">
                            <b>Question:</b>  
                        </div>
                        <div class="col-xs-8 col-md-8 col-lg-8">
                            <textarea name="txtquestion" class="form-control" placeholder="question" required></textarea>
                        </div>
                        </div>
                    </div>

                <div class="container2">
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <em>Select a type for question and continue</em>
                            <ul>
                                <li>
                                    <span><input type="radio" name="txttype" value="M" data-ng-click="show = 1" required/>Multiple choice</span>
                                    <span class="tab"><input type="radio" name="txttype" value="T" data-ng-click="show = 2" />True and false</span>
                                    <span class="tab"><input type="radio" name="txttype" value="B" data-ng-click="show = 3" />Fill in Blank</span>
                                </li>
                            </ul> 
                        </div>
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <!-- Format for multiple choice -->
                            <div class="form-group" data-ng-show="show===1">   
                                <p>Multiple Choice</p>
                                <input class="form-control" type="text" name="txtinput1" placeholder="A"/>
                                <input class="form-control" type="text" name="txtinput2" placeholder="B"/>
                                <input class="form-control" type="text" name="txtinput3" placeholder="C"/>
                                <input class="form-control" type="text" name="txtinput4" placeholder="D"/>
                            </div>
                            <!-- Format for fill in the blank -->
                            <div class="form-group" data-ng-show="show===3" > 
                                <p>Choices</p>
                                <input class="form-control" type="text" name="txtinput1" placeholder="Choice 1"/>
                                <input class="form-control" type="text" name="txtinput2" placeholder="Choice 2"/>
                                <input class="form-control" type="text" name="txtinput3" placeholder="Choice 3"/>
                                <input class="form-control" type="text" name="txtinput4" placeholder="Choice 4"/>
                            </div>
                        </div>
                    </div>

                    <!-- hint-->
                    <div class="row">
                        <div class="col-xs-4 col-md-4 col-lg-4">
                            <span class="hinticon glyphicon glyphicon-search"></span><b>Hint:</b>  
                        </div>
                        <div class="col-xs-8 col-md-8 col-lg-8">
                            <input type="text" name="txthints" class="form-control" required/>
                        </div>
                    </div>

                    <!-- answer -->
                    <div class="row">
                        <div class="col-xs-4 col-md-4 col-lg-4">
                            <b>Answer:</b>  
                        </div>
                        <div class="col-xs-8 col-md-8 col-lg-8">
                            <input class="form-control" type="text" name="txtchecked" required/>
                        </div>
                    </div>
  
                    <!-- explanation -->
                    <div class="row">
                        <div class="col-xs-4 col-md-4 col-lg-4">
                            <b>Explanation:</b>  
                        </div>
                        <div class="col-xs-8 col-md-8 col-lg-8">
                            <textarea name="txtexplain" class="form-control" required></textarea>
                        </div>
                    </div>
                    <button type="submit" name="btnAdd" class="btn btn-primary" data-ng-disabled="addForm.$invalid">Save</button>
                    <a class="btn btn-primary" href="question.jsp?id=<%=quizID%>">Cancel</a>
                </div> 
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
