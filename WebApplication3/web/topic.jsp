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
            Connection conn, con;
            PreparedStatement pstmt;
            String qry, qry1;
            Statement stmt, st;
            ResultSet result, rs;
            Integer quizID;
            String name;
        %>
        
        <%-- READ function--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            try{
                Class.forName("com.mysql.jdbc.Driver");
               
                stmt=conn.createStatement();
                qry = "SELECT * FROM quiz";
                result = stmt.executeQuery(qry);

            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            }
             
        %>

 
        <h2>Quiz List</h2>
        <div class="table-responsive">
        <table class="table table-stripped table-hover sortable">
            <thead>
                <tr>
                    <th id="no" scope="col">No.</th>
                    <th id="quiz" scope="col">Quiz</th>
                    <th id="adddate" scope="col">Created on</th>
                    <th id="updatedate" scope="col">Last Update</th>
                    <th id="edit" scope="col" class="tdcenter">Edit</th>
                    <th id="del" scope="col" class="tdcenter">Delete</th>
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
                    <td headers="quiz"><a href="question.jsp"><%=result.getString("quizTopic") %></a></td>
                    <td headers="adddate"><%=result.getString("cdate") %></td>
                    <td headers="updatedate"><%=result.getString("udate") %></td>
                    <td headers="edit" class="tdcenter"><a class="glyphicon glyphicon-edit" href="updateTopic.jsp?id=<%=quizID%>"></a></td>
                    <td headers="del" class="tdcenter"><a class="glyphicon glyphicon-trash" href="deleteTopic.jsp?id=<%=quizID%>" onclick="return confirm('Once confirm, this topic <%=result.getString("quizTopic") %> will be removed. Confirm to delete?')"></a></td>
                </tr> 
        <%
                quizNo++;
            }
        %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6">
                        <a class="glyphicon glyphicon-plus-sign" href="addTopic.jsp"> New Topic</a>

                        <button class="glyphicon glyphicon-plus-sign" data-toggle="collapse" data-target="#addtopic"> New Topic</button>
                    </td>
                </tr>
            </tfoot>
        </table>       
        </div>
            
            <div id="addtopic" class="collapse">
               
                    <div class="container">

        <div class="row"><!--2--> 
            <div class="col-xs-12 col-md-12 col-lg-12"><!--2.1--> 
                <center>
                <h1>Add New Topic</h1>
                <hr/>
                <form id="addForm" action="" method="POST">  
                <ul>
                    <li class="questioncontainer"><h2>New Topic:</h2> </li>
                    <li class="container2"><input type="text" name="txtName" id="txtName" size="100%"/></li>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit" name="btnAdd" id="btnAdd">Add Topic</button>
                    
                    </div>
                </ul>
                </form>
                </center>
            </div>
        </div>
    </div>
            </div>
            
   
        <div class="row">
            <div class="col-xs-6 col-md-6 col-lg-6">
                <hr/>
                <h2>2cd option design</h2>
                <p>display quiz here</p>
               
            </div>
    

            <div class="col-xs-6 col-md-6 col-lg-6"> 
                <hr/>
                <p>click and display here.....(so far cant sad case OTL)</p>  
        
    
            </div>
        </div>
  
<!-- sort table; only work well with google chrome -->                  
<script src="frameworks/js/sorttable.js"></script> 





</body>
</html>

