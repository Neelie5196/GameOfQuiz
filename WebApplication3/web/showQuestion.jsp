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
            Integer z = 0;
            Integer quizID;
        %>
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
                      <li><a href="index.html">Topic List / </a></li>
                    <li class="active" ><a href="#">Show Question<span class="sr-only">(current)</span></a></li>
                    
                    
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
                    <li><a href="video.jsp">Back to EQUILIBRA</a></li>
                  </ul>
                </div>
              </div>
            </nav>
      
        <div class="row"><!--3--> 
            <div class="col-xs-10 col-md-10 col-lg-10"><!--3.1-->
                
                <h1>Update Topic <%=result.getInt("quizID")%> Question <%=result.getInt("questionID")%></h1> 
                <i>Press "Save" to commit and "Cancel to return to previous page</i>
                
            </div>
            
            <div class="col-xs-1 col-md-1 col-lg-1"> <!--3.2--> 
                <a class="btn btn-sm btn-primary glyphicon glyphicon-edit" href="updateQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>">Edit</a>
            </div>
            <div class="col-xs-1 col-md-1 col-lg-1"> <!--3.3--> 
                <button class="btn btn-sm btn-danger glyphicon glyphicon-trash" href="deleteQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>" onclick="return confirm('Once confirm, question <%=result.getString("questionID") %> will be removed. Confirm to delete?')"> Delete</button>
            </div>
        </div><hr/>
        <div class="row"><!--4--> 
            <div class="col-xs-12 col-md-12 col-lg-12"><!--4.1 -->
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
            <a class="btn btn-primary" href="question.jsp?id=<%=quizID%>">Back</a>
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
