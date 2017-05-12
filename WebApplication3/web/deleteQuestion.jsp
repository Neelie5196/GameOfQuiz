<%-- 
    Document   : deleteQuestion
    Created on : Apr 26, 2017, 5:14:37 PM
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
            Integer questionID;
            Integer quizID;
        %>
        <%
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){
                quizID = Integer.parseInt(request.getParameter("quiz"));
                questionID = Integer.parseInt(request.getParameter("id"));
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");

                    qry = "DELETE FROM question WHERE questionID = ?";
                    pstmt = conn.prepareStatement(qry);
                    pstmt.setInt(1, questionID);
                    pstmt.executeUpdate();
                    response.sendRedirect("./question.jsp?id=" + quizID);
                
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }  
            }
        %>
    </body>
</html>




