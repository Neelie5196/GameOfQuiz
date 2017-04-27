<%-- 
    Document   : updateTopic
    Created on : Apr 25, 2017, 12:23:34 AM
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
            ResultSet result;
            String qry;
            Integer quizID;
        %>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("btnUpd")!=null){
                quizID = Integer.parseInt(request.getParameter("hiddenId"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "UPDATE quiz SET quizTopic = ?, bonus = ? WHERE quizID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1, request.getParameter("txtName1"));
                pstmt.setString(2, request.getParameter("txtName2"));
                pstmt.setInt(3, quizID);
                pstmt.executeUpdate();
                response.sendRedirect("./index.html");
                
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }
            }
            
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                quizID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");

                qry = "SELECT * FROM quiz WHERE quizID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1,quizID);
                result = pstmt.executeQuery();
                result.first();
                
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                } 
            }else{
                response.sendRedirect("./index.html");
            }
        %>
        
    <center>
        <h1>Update Topic & Topic Bonus</h1>
        <form id="updForm" action="" method="POST">
            <table cellspacing="5" cellpadding="5">
                <tbody>
                    <tr>
                        <td>Topic: </td>
                        <td>
                            <input type="hidden" name="hiddenId" id="hiddenId" value="<%=quizID%>"/>
                            <input type="text" name="txtName1" id="txtName" value="<%=result.getString("quizTopic")%>"/>
                        </td>
                        
                        <td>Topic Bonus: </td>
                        <td>
                            <input type="text" name="txtName2" id="txtName" value="<%=result.getString("bonus")%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnUpd" value="Update Employee" id="btnUpd"/></td>
                        <td><button type="button" href="index.html">Cancel</button></td>
                    </tr>     
                </tbody>
            </table>
        </form>             
    </center>
    </body>
</html>
