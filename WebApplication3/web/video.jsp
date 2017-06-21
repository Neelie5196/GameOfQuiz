<%-- 
    Document   : question
    Created on : Apr 29, 2017, 11:59:49 PM
    Author     : tingting17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html data-ng-app="myApp">

<body>
    <%!
        Connection conn;
        Statement stmt;
        ResultSet result;
        String qry;
    %>

    <%-- READ function for videos--%>
    <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            stmt=conn.createStatement();
            qry = "SELECT * FROM video";
            result = stmt.executeQuery(qry);
        }catch(ClassNotFoundException cnfe){
            out.println("Class not Found Execption:-" + cnfe.toString());
        }catch(SQLException sqle){
            out.println("SQL Query Exception:- " + sqle);
        }
    %>
        

    <div data-ng-init="biology=true">
        <div class="row"><!--3.1-->
            <div class="col-xs-12 col-md-12 col-lg-12 "> <!--3.1.1-->
                <b>Topic:</b> 
                <a data-ng-click="biology=true; english=false" class="">Biology |</a>
                <a data-ng-click="english=true; biology=false" class="">English |</a>
            </div>
        </div>

        <div class="row"><!--3.2-->
            <div class="col-xs-12 col-md-12 col-lg-12"><!--3.2.1-->
                <div data-ng-show="biology">
                <h3>Biology</h3>
        <%
            while(result.next() && (result.getString("category").equalsIgnoreCase("biology"))) {          
        %>
                <div class="videowrap">
                    <h4><%=result.getString("videoName") %></h4>       
                    <div class="row"><!--3.2.1.1-->
                        <div class="col-xs-4 col-md-4 col-lg-4"><!--3.2.1.1.1-->
                            <video width="100%" controls>
                                <source src="<%=result.getString("videoPath")%>" type="video/mp4">
                            </video>
                        </div>

                        <div class="col-xs-6 col-md-6 col-lg-6"><!--3.2.1.2-->
                            <p><%=result.getString("videoDesc") %></p>
                        </div>            
                        
                        <!-- this ned discuss-->
                        <!--3.2.1.3
                        <div class="col-xs-2 col-md-2 col-lg-2 quizbtn"> 
                            <a href="topic.jsp"><button class="btn-lg btncreate">Create quiz</button></a>
                        </div>-->
                    </div>
                </div>
        <%
            }
        %>
                </div>
            
                <div data-ng-show="english">
                <h3>English</h3>
        <%
            while(result.next() && (result.getString("category").equalsIgnoreCase("english"))) {
        %>
                <div class="videowrap">
                    <h4><%=result.getString("videoName") %></h4> 
                    <div class="row"><!--3.2.1.2-->
                        <div class="col-xs-4 col-md-4 col-lg-4"><!--3.2.1.2.1-->
                            <video width="100%" controls>
                                <source src="<%=result.getString("videoPath") %>" type="video/mp4">
                            </video>
                        </div>

                        <div class="col-xs-6 col-md-6 col-lg-6"><!--3.2.1.2.2-->
                            <p><%=result.getString("videoDesc") %></p>
                        </div>            

                        <!-- this ned discuss-->
                        <!--3.2.1.3
                        <div class="col-xs-2 col-md-2 col-lg-2 quizbtn"> 
                            <a href="topic.jsp"><button class="btn-lg btncreate">Create quiz</button></a>
                        </div>-->
                    </div>
                </div>
        <%
            }
        %>
            </div>
            </div>
        </div>
    </div>

            
            
           
            
</body>
</html>



