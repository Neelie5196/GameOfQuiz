<%-- 
    Document   : reward
    Created on : Jun 21, 2017, 12:25:37 PM
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
            Statement stmt;
            ResultSet result;
        %>
        
        <%-- READ function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                stmt=conn.createStatement();
                qry = "SELECT * FROM reward";
                result = stmt.executeQuery(qry);
                
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            }
             
        %>

        <h2>Reward List</h2>
        <div class="table-responsive">
        <table class="table table-stripped table-hover sortable">
            <thead>
                <tr>
                    <th id="no" scope="col">No.</th>
                    <th id="quiz" scope="col">Reward</th>
                    <th id="adddate" scope="col">Created on</th>
                    <th id="updatedate" scope="col">Last Update</th>
                    <th id="edit" scope="col" class="tdcenter">Edit</th>
                    <th id="del" scope="col" class="tdcenter">Delete</th>
                </tr>
            </thead>                      
            <tbody>
        <%
            Integer reward = 1;
            while(result.next()) {
        %>
                <tr>
                    <td headers="no"><%=reward%></td>
                    <td headers="reward"><a href=""><%=result.getString("reward") %></a></td>
                    <td headers="adddate"><%=result.getString("cdate") %></td>
                    <td headers="updatedate"><%=result.getString("udate") %></td>
                    <td headers="edit" class="tdcenter"><a class="glyphicon glyphicon-edit" href=""></a></td>
                    <td headers="del" class="tdcenter"><a class="glyphicon glyphicon-trash" href=""></a></td>
                </tr> 
        <%
                reward++;
            }
        %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6">
                        <a class="glyphicon glyphicon-plus-sign" href=""> New Reward</a>

                     </td>
                </tr>
            </tfoot>
        </table>       
        </div>
            
    </body>
</html>
