<%-- 
    Document   : question
    Created on : Apr 25, 2017, 10:48:31 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>

       <%!
            Connection conn;
            PreparedStatement pstmt;
            ResultSet result,rs;
            String qry;
            Integer quizID;
            
        %>
        
        <%-- READ function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                quizID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");
                qry = "SELECT * FROM question WHERE quizID = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1,quizID);
                result = pstmt.executeQuery();
 
                
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

        
        <div class="row"><!--2--> 
            <div class="col-xs-12 col-md-12 col-lg-12"> <!--2.1 -->
                <div class="panel panel-default">
                <div class="panel-heading"> <h1>Question List</h1></div>
                <div class="table-responsive">
                <table class="table table-stripped table-hover" data-ng-controller="more">
                    <thead>
                        <tr>
                            <th id="no" scope="col" >No.</th>
                            <th id="quez" scope="col" >Question</th>
                            <th id="typeq" scope="col" class="tdcenter">Type</th>
                            <th id="more" scope="col" class="tdcenter">Preview</th>
                            <th id="edit" scope="col" class="tdcenter">Edit</th>
                            <th id="delete" scope="col" class="tdcenter">Delete</th>
                        </tr>
                    </thead>                      
                    <tbody>      
                        <%
                            Integer questionNo = 1;
                            while(result.next()) {
                                quizID = result.getInt("quizID");
                        %>

                        <tr>
                            <td headers="no"><%=questionNo%></td>
                            <td headers="quez"><%=result.getString("question") %></td>
                            <td headers="typeq" class="tdcenter"><%=result.getString("type") %></td>
                            <td headers="more" class="tdcenter"><a class="glyphicon glyphicon-eye-open" href="showQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>"></a></td>
                            <td headers="edit" class="tdcenter"><a class="glyphicon glyphicon-edit" href="updateQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>"></a></td>
                            <td headers="del" class="tdcenter"><a class="glyphicon glyphicon-trash" href="deleteQuestion.jsp?id=<%=result.getInt("questionID")%>&quiz=<%=result.getInt("quizID")%>" onclick="return confirm('Once confirm, question <%=result.getString("questionID") %> will be removed. Confirm to delete?')"></a></td>
                        </tr>

                        <%
                            questionNo++;
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5">
                                <span class="glyphicon glyphicon-plus-sign" /><a style="font-family:'Open Sans', Lato, Helvetica,Arial,sans-serif" href="addQuestion.jsp?id=<%=quizID%>"> New Question</a>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                </div>
                </div>
                    
                <p><a href="index.html" class="btn btn-primary">Back To Topic</a></p> 
            </div>
        </div>
        </center>

   
<!-- jQuery – required for Bootstrap's JavaScript plugins) -->
<script src="frameworks/js/jquery.min.js"></script>

<!-- All Bootstrap plug-ins file -->
<script src="frameworks/js/bootstrap.min.js"></script>
    
<!-- Basic AngularJS-->
<script src="frameworks/js/angular.js"></script>
        
<!-- Angular-route-->
<script src="frameworks/js/angular-route.min.js"></script>   

<!-- Configuration-->
<script src="frameworks/js/gameOQ.js"></script>
</body>
</html>