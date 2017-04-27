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
            Integer questionID;
        %>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("btnUpd")!=null){
                questionID = Integer.parseInt(request.getParameter("hiddenId"));
                
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "UPDATE question SET question = ?, hints= ?, input1= ?, input2= ?, input3= ?, input4= ? WHERE questionID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1,request.getParameter("txtquestion"));
             
                pstmt.setString(2,request.getParameter("txthints"));
                pstmt.setString(3,request.getParameter("txtinput1"));
                pstmt.setString(4,request.getParameter("txtinput2"));
                pstmt.setString(5,request.getParameter("txtinput3"));
                pstmt.setString(6,request.getParameter("txtinput4")); 
                pstmt.setInt(7, questionID);
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
        
    <center>
        <form id="updForm" action="" method="POST">
            <table border="0" cellspacing="5" cellpadding="5">
                     <h3 class="modal-title">Add New Question</h3><hr/>
                     <input type="hidden" name="hiddenId" id="hiddenId" value="<%=questionID%>"/>
                <tbody>
                    <tr>
                        <td>Question:</td>
                        <td><textarea name="txtquestion" class="form-control" placeholder="<%=result.getString("question") %>"></textarea></td>
                    </tr>

                     <tr>
                        <td>Hints</td>
                        <td><input type="text" name="txthints" class="form-control" placeholder="<%=result.getString("hints") %>"/></td>
                    </tr>
                    
                    <tr>
                        <td>Type:</td>
                        <td><p><%=result.getString("type") %></p></td>
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

                                <!-- choose the right answer  -->
                                <div class="form-group">       
                                    <label>Correct Answer:</label> 
                                    <select class="form control" name="txtchecked">
                                        <option selected hidden value="NA">Choose here</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="form-group" data-ng-show="show===2 ">
                                <div class="form-group" >         
                                    <input type="text" name="txtinput1" placeholder="True/False"/>
                                </div>
                            </div>
                            <div class="form-group" data-ng-show="show===3 ">
                                <div class="form-group" >         
                                    <input type="text" name="txtinput1" placeholder="Answer"/>
                                </div>
                            </div> 
                </td>
                        <td colspan="2">             
                                <div class="form-group" >         
                                    A. <input type="text" name="txtinput1" placeholder="<%=result.getString("input1") %>"/>
                                </div>
                                <div class="form-group" >         
                                    B.<input type="text" name="txtinput2" placeholder="<%=result.getString("input2") %>"/>
                                </div>
                                <div class="form-group" >              
                                    C.<input type="text" name="txtinput3" placeholder="<%=result.getString("input3") %>"/>
                                </div>
                                <div class="form-group" >      
                                    D.<input type="text" name="txtinput4" placeholder="<%=result.getString("input4") %>"/>
                                </div>
                                
                                <p>Note* Ensure the answer remain <%=result.getString("checked") %></p>
                           
                            <div data-ng-if="<%=result.getString("type") %> == 'B'" >
                            
                            <div class="form-group" >         
                                <input type="text" name="txtinput1" placeholder="<%=result.getString("input1") %>" />
                            </div>
                            
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnUpd" value="Update Question" id="btnUpd"/></td>
                        <td><button type="button" href="topic.jsp">Cancel</button></td>
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

<!-- Configuration -->
<script src="frameworks/js/gameOQ.js"></script>    


</body>
</html>
