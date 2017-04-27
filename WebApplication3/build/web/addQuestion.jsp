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

                        qry = "INSERT INTO question(quizID, question, type,hints, input1, input2, input3, input4, checked) VALUES(?,?,?,?,?,?,?,?,?)";
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
                        pstmt.executeUpdate();
                        response.sendRedirect("./question.jsp");
                    }catch(ClassNotFoundException cnfe){
                        out.println("Class not Found Execption:-" + cnfe.toString());
                    }catch(SQLException sqle){
                        out.println("SQL Query Exception:- " + sqle);
                    }
                } 
            }else{
                response.sendRedirect("./question.jsp");
            }
        %>
    <center>
        <h3 class="modal-title">Add New Question</h3><hr/>
        <form id="addForm" action="" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Question:</td>
                        <td><textarea name="txtquestion" class="form-control" placeholder="question" ></textarea></td>
                    </tr>
                    <tr>
                        <td>Hints</td>
                        <td><input type="text" name="txthints" class="form-control" placeholder="Add Hints here"/></td>
                    </tr>
                    <tr>
                        <td>
                           <em>Select a type for question and continue</em> 
                        </td>
                        <td>
                            <ul>
                                <li><input type="radio" name="txttype" value="M" data-ng-click="show = 1" />Multiple choice</li>
                                <li><input type="radio" name="txttype" value="T" data-ng-click="show = 2" />True and false</li>
                                <li><input type="radio" name="txttype" value="B" data-ng-click="show = 3" />Fill in Blank</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">                     
                            <div class="form-group" data-ng-show="show===1" > 
                                <div class="form-group" >         
                                    A. <input type="text" name="txtinput1" />
                                </div>
                                <div class="form-group" >         
                                    B.<input type="text" name="txtinput2" />
                                </div>
                                <div class="form-group" >         
                                    C.<input type="text" name="txtinput3" />
                                </div>
                                <div class="form-group" >        
                                    D.<input type="text" name="txtinput4" />
                                </div>
                                
                                <div class="form-group" >         
                                    <input type="text" name="txtchecked" placeholder="A? B? C? D? "/>
                                </div>
                                
                            </div>
                            <div class="form-group" data-ng-show="show===2 ">
                                <div class="form-group" >         
                                    <input type="text" name="txtchecked" placeholder="True/False"/>
                                </div>
                            </div>
                            <div class="form-group" data-ng-show="show===3 ">
                                <div class="form-group" >         
                                    <input type="text" name="txtchecked" placeholder="Answer"/>
                                </div>
                            </div>  
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnAdd" value="Save"  /> </td>
                        <td><button type="button" href="question.jsp?id=<%=quizID%>">Cancel</button></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
                   
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
