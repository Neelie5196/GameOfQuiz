<%-- 
    Document   : signup
    Created on : Jun 14, 2017, 8:29:47 PM
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
            if(request.getParameter("signup") != null){
                try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
               
                qry = "INSERT INTO admin(username, name, department, password) VALUES(?,?,?,?)";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1,request.getParameter("username"));
                pstmt.setString(2,request.getParameter("name"));
                pstmt.setString(3,request.getParameter("department"));
                pstmt.setString(4,request.getParameter("password"));
                pstmt.executeUpdate();
                response.sendRedirect("./index.html");
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }  
            }
        %>
    </body>
</html>
