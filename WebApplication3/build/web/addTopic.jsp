<%-- 
    Document   : addTopic
    Created on : Apr 24, 2017, 11:12:32 PM
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
</head>
<body>
        <%!
            Connection conn;
            PreparedStatement pstmt;
            String qry;
        %>
        
        <%-- CREATE function--%>
        <%
            if(request.getParameter("btnAdd") != null){
                try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
               
                qry = "INSERT INTO quiz(quizTopic, bonus) VALUES(?,?)";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1,request.getParameter("txtName"));
                pstmt.setString(2,request.getParameter("txtBonus"));
                pstmt.executeUpdate();
                response.sendRedirect("./index.html");
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }  
            }
        %>
    <center>
        <h1>Add New Topic</h1>
        <form id="addForm" action="" method="POST">
            <table cellspacing="5" cellpadding="5">
                <tbody>
                    <tr>
                        <td>New Topic: </td>
                        <td> <input type="text" name="txtName" id="txtName"/></td>
                    </tr>
                    <tr>
                        <td>Topic Bonus: </td>
                        <td><textarea name="txtBonus" id="txtBonus"></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnAdd" value="Add Topic" id="btnAdd"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
