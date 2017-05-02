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
<head>
                
<!-- Description: Game of Quiz -->
<!-- Author: Eileen Kho, Leslie Ling, Ting Lee Ting -->
<!-- Last update: 2017-->
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<meta name="viewport" content="width=device-width, initialscale=1.0"/>
<!-- Bootstrap -->
<link href="frameworks/css/bootstrap.min.css" rel="stylesheet" />
<!-- StyleSheet -->
<link href="frameworks/css/style.css" rel="stylesheet" />
<!-- StyleSheet -->
<link href="languages.min.css" rel="stylesheet" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body >
       <%!
            Connection conn;
            PreparedStatement pstmt;
            ResultSet result;
            String qry;
            Integer quizID;
            String g;                       

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

    <div class="container">
    <div class="row"><!--3--> 
        <div class="col-xs-12 col-md-12 col-lg-12"> <!--3.1 --> 
            <%
                while(result.next()) {
                    quizID = result.getInt("quizID");
                    String check = result.getString("checked");
            %>

            <div id="<%=result.getInt("questionID") %>" class="container-fluid section">
            <h1>Question <%=result.getInt("questionID") %></h1>
  
            <center>
            <ul>
                <li>
                    <div class="showdata">
                        <h2><%=result.getString("question") %></h2>
                        <button class="btn btn-primary pull-right btn-sm glyphicon glyphicon-eye-open right" type="button" data-ng-click="scopeVar=scopeVar!==true">Hints</button>
                        <p id="hint" data-ng-show="scopeVar"><%=result.getString("hints") %></p>
                    </div>
                </li>
                
                <!-- Format for multiple choice -->
                <div data-ng-if="'<%=result.getString("type")%>' === 'M'">
                    <li><input type="radio" data-ng-model="checkeds" value="A" />A. <%=result.getString("input1") %></li>
                    <li><input type="radio" data-ng-model="checkeds" value="B" />B. <%=result.getString("input2") %></li>
                    <li><input type="radio" data-ng-model="checkeds" value="C" />C. <%=result.getString("input3") %></li>
                    <li><input type="radio" data-ng-model="checkeds" value="D" />D. <%=result.getString("input4") %></li>
                
                <button type="button" class="btn btn-lg" data-ng-click="show = 1">Check</button>    
                <!-- check answer-->
                <div data-ng-show="show === 1">
                    <div data-ng-if="checkeds === '<%=result.getString("checked")%>'" >
                        <p>Correct</p>
                    </div>
                    <div data-ng-if="checkeds !== '<%=result.getString("checked")%>'">
                        <p>Incorrect</p>
                    </div>
                </div>
                </div>
                
                <!-- Format for Fill in the Blank -->
                <div data-ng-if="'<%=result.getString("type")%>' === 'B'">
                <li id="fiblank">
                    <span class="tab"><%=result.getString("input1") %></span>
                    <span class="tab"><%=result.getString("input2") %></span>
                    <span class="tab"><%=result.getString("input3") %></span>
                    <span><%=result.getString("input4") %></span>
                </li>
                </div>
                
                <!-- User input for Fill in the Blank & True False -->
                <div data-ng-if="'<%=result.getString("type")%>' === 'B' || '<%=result.getString("type")%>' === 'T'">
                <li>
                    <h4>Answer:</h4>
                    <input type="text" name="answer" data-ng-model="checkeds" />
                </li>
                <button type="button" class="btn btn-lg" data-ng-click="show = 1">Check</button>    
                <!-- check answer-->
                <div data-ng-show="show === 1">
                    <div data-ng-if="checkeds === '<%=result.getString("checked")%>'" >
                        <p>Correct</p>
                    </div>
                    <div data-ng-if="checkeds !== '<%=result.getString("checked")%>'">
                        <p>Incorrect</p>
                    </div>
                </div>
                </div>      
            </ul>  
            </center>
            </div>     

            <%
                }
            %>
        </div>    
    </div>


    <div class="row"><!--4--> 
        <div class="col-xs-12 col-md-12 col-lg-12"> <!--4.1 --> 
    <a href="index.html">Back To Topic</a>
    <a class="glyphicon glyphicon-hand-up pull-right" data-ng-click="report=report!==true">Report a problem</a>
        <!--mayb make it as modal?c1st-->     
        <div data-ng-show="report">
        <form>
        <fieldset>
            <legend>What's wrong?</legend>
            <div class="form-group">
                <input type="checkbox" value="wrong Ans" />The answer is wrong.
            </div>
            <div class="form-group">
                <input type="checkbox" value="hint is confusing/wrong" />The hint is confusing/wrong.
            </div>
            <div class="form-group">
                <input type="checkbox" value="typo error" />There is/are typo error.
            </div> 
            <div class="form-group">
                <p>others:</p><textarea name="field6" class="textarea-field"></textarea>
            </div>

            <label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
        </fieldset>
        </form>
        </div>
    </div>
    </div>
    </div>
       
   
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
