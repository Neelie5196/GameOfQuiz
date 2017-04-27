<%-- 
    Document   : showQuestion
    Created on : Apr 27, 2017, 4:09:42 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
       
        <table>
        <h3 class="modal-title">Question:<%=result.getInt("questionID")%></h3><hr/>
            <tr>
                <td>Question:</td>
                <td><%=result.getString("question") %></td>
            </tr>

            <tr>
                <td>Hints:</td>
                <td><%=result.getString("hints") %></td>
            </tr>
                    
            <tr>
                <td>Type:</td>
                <td><%=result.getString("type") %></td>
            </tr>
            
            <tr>        
                <td colspan="2">
                    <p><%=result.getString("input1") %></p>
                    <p><%=result.getString("input2") %></p>
                    <p><%=result.getString("input3") %></p>
                    <p><%=result.getString("input4") %></p>

                    <p>Answer: <%=result.getString("checked") %></p>              

                </td>

            </tr>
            
            <tr>
                <td><a href="index.html">Seen</a></td>

                <td headers="edit"><a class="glyphicon glyphicon-edit" href="updateQuestion.jsp?id=<%=result.getInt("questionID")%>"></a></td>
                <td headers="del"><a class="glyphicon glyphicon-trash" href="deleteQuestion.jsp?id=<%=result.getInt("questionID")%>" onclick="return confirm('Once confirm, question <%=result.getString("questionID") %> will be removed. Confirm to delete?')"></a></td>

            </tr>
           
            </table>
            
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
