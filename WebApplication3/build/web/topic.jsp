<%-- 
    Document   : topic
    Created on : Apr 24, 2017, 5:24:56 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<body>
        <%!
            Connection conn;
            PreparedStatement pstmt;
            String qry;
            Statement stmt;
            ResultSet result;
            Integer quizID;
            
        %>
        
        <%-- READ function--%>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
                stmt=conn.createStatement();
                qry = "SELECT * FROM quiz";
                result = stmt.executeQuery(qry);
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            }
        %>

    <center>
        <div class="panel panel-default">
        <div class="panel-heading"><h1>Topic List</h1></div>

        <div class="table-responsive">
        <table class="table table-stripped table-hover" data-ng-controller="more">
            <thead>
                <tr>
                    <th id="no" scope="col" >No.</th>
                    <th id="topic" scope="col" >Topic</th>
                    <th id="bonus" scope="col" >Bonus</th>
                    <th id="edit" scope="col" >Edit</th>
                    <th id="del" scope="col" >Delete</th>
                </tr>
            </thead>                      
            <tbody>
                <%
                    Integer quizNo = 1;
                    while(result.next()) {
                        quizID = result.getInt("quizID");
                %>

                <tr>
                    <td headers="no"><%=quizNo%></td>
                    <td headers="topic"><a href="question.jsp?id=<%=quizID%>"><%=result.getString("quizTopic") %></a></td>
                    <td headers="bonus"><button data-toggle="modal" data-target="#myModal" id="<%=result.getString("quizTopic") %>" value="<%=result.getString("bonus") %>">Show more</button>
                        <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"></h4>
                            </div>
                            <div class="modal-body">...</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Back</button>
                            </div>
                        </div>
                        </div>
                        </div>
                    </td>       
                    <td headers="edit"><a class="glyphicon glyphicon-edit" href="updateTopic.jsp?id=<%=quizID%>"></a></td>
                    <td headers="del"><a class="glyphicon glyphicon-trash" href="deleteTopic.jsp?id=<%=quizID%>" onclick="return confirm('Once confirm, this topic <%=result.getString("quizTopic") %> will be removed. Confirm to delete?')"></a></td>
                </tr>
                
                <%
                    quizNo++;
                    }
                %>

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5">
                        <span class="glyphicon glyphicon-plus-sign"/><a href="addTopic.jsp"> New Topic</a>
                    </td>
                </tr>
            </tfoot>
        </table>       
        </div>
        </div> 
    </center>
</body>
</html>
