<%-- 
    Document   : bonus
    Created on : May 11, 2017, 12:45:01 AM
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
<link href="style.css" rel="stylesheet" />
<!-- StyleSheet -->
<link href="languages.min.css" rel="stylesheet" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript">
         
            var imgObj = null;
            var txtObj = null;
            
            function init(){
               imgObj = document.getElementById('myImage');
               imgObj.style.position= 'relative'; 
               imgObj.style.left = '0px';
               
               txtObj = document.getElementById('txtObj');
               txtObj.style.position= 'relative'; 
               txtObj.style.left = '-50%';
            }
            
            function moveRight(){
               imgObj.style.left = parseInt(imgObj.style.left) + 20 + '%';
               txtObj.style.left = parseInt(txtObj.style.left) + 10 + '%';
            }
            
            window.onload =init;
         
      </script>
            
    </head>
    <body class="forbonus">
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
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            if(request.getParameter("id") != null && request.getParameter("id")!= ""){  
                quizID = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");
                qry = "SELECT * FROM quiz where quizID = ?";
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

    <div data-ng-hide="cat=cat===true">
        <img src="resources/img/cathungry.jpg"/>  
        <p>Pusheen the cat is blocking your reward</p>
        <button data-ng-click="cat=cat!==true">Feed</button>
        <input type="button" value="Go Back" onclick="location.href='question.jsp?id=<%=quizID%>';"/>
    </div>   
  
    <form data-ng-show ="cat"> 
        <div >
        <%
            while(result.next() ) {
                quizID = result.getInt("quizID");  
        %> 
        
           <p id="txtObj"><%=result.getString("bonus") %></p>
                
        <% } %>
        </div>
        <img id="myImage" src="resources/img/catfood.gif" />
        <p>Push Pusheen the cat to aside</p>
        <input type="button" value="Push" onclick="moveRight();" />
        <input type="button" value="Go Back" onclick="location.href='question.jsp?id=<%=quizID%>';"/>
    </form>

        
        
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


