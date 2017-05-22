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
               txtObj.style.left = '-100%';
            }
            
            function moveRight(){
               imgObj.style.left = parseInt(imgObj.style.left) + 20 + '%';
               txtObj.style.left = parseInt(txtObj.style.left) + 10 + '%';
            }
            
            window.onload =init;
            
            
            
interact('.draggable')  
  .draggable({
    // enable inertial throwing
    inertia: true,
    // keep the element within the area of it's parent
    restrict: {
      restriction: "parent",
      endOnly: true,
      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
    },
    // enable autoScroll
    autoScroll: true,
    // call this function on every dragmove event
    onmove: dragMoveListener,
  });

  function dragMoveListener (event) {
    var target = event.target,
        // keep the dragged position in the data-x/data-y attributes
        x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
        y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

    // translate the element
    target.style.webkitTransform =
    target.style.transform =
      'translate(' + x + 'px, ' + y + 'px)';

    // update the posiion attributes
    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
  }



    // Initialize Interact.js Drag & Drop
    interact('.draggable').draggable({
        inertia: true,
        restrict: {
          restriction: "#visualizer-panel",
          endOnly: true,
          elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
        },
        onmove: function (event) {
          var target = event.target,
              // keep the dragged position in the data-x/data-y attributes
              x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
              y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;
    
          // translate the element
          target.style.webkitTransform =
          target.style.transform =
            'translate(' + x + 'px, ' + y + 'px)';
    
          // update the posiion attributes
          target.setAttribute('data-x', x);
          target.setAttribute('data-y', y);
        },
        onend: function(event) {
            console.log(event);
        }
    });

    interact('.dropzone').dropzone({
        accept: '.draggable',
        overlap: 0.01,

        // add / remove dropzone feedback
        ondropactivate: function (event) {
            event.target.classList.add('drop-active');
        },
        ondropdeactivate: function (event) {
            event.target.classList.remove('drop-active');
        },

        // add / remove dropzone feedback
        ondragenter: function (event) {
            var draggableElement = event.relatedTarget,
                dropzoneElement = event.target;
            dropzoneElement.classList.add('drop-target');
            draggableElement.classList.add('can-drop');
        },
        ondragleave: function (event) {
            event.target.classList.remove('drop-target');
            event.relatedTarget.classList.remove('can-drop');
        },

        // drop successful
        ondrop: function (event) {
            console.log(event);
        }
    });

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

    
    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <center data-ng-hide="cat=cat===true" class="hungry">
                <img src="resources/img/cathungry.jpg"/>  
                <p>Pusheen the cat is blocking your reward</p>
                <button data-ng-click="cat=cat!==true">Feed</button>
                <input type="button" value="Go Back" onclick="location.href='question.jsp?id=<%=quizID%>';"/>
            </center>
            
            <form data-ng-show ="cat"> 
             
                <%
                    while(result.next() ) {
                        quizID = result.getInt("quizID");  
                %> 
                <div class="row">
                    <div class="col-xs-4 col-md-4 col-lg-4">
                       <p id="txtObj" class="bo"><%=result.getString("bonus") %></p>
                    </div>
                    <div class="col-xs-8 col-md-8 col-lg-8">
                       <img id="myImage" src="resources/img/catfood.gif" />
                    </div>
                </div>
                <% } %>
              
                <center>
                    <p>Push Pusheen the cat to aside</p>
                    <input type="button" value="Push" onclick="moveRight();" />
                    <input type="button" value="Go Back" onclick="location.href='question.jsp?id=<%=quizID%>';"/>
                </center>
            </form>
        </div>        
    </div>
                

                
                
                
<div id="visualizer-panel">
    <div class="leftStuff panel">
        <div class="panel-heading">
            <h4 class="panel-title">Draggables</h4>
        </div>
        <div class="panel-body">
            <ul class="list-group">
                <li class="list-group-item draggable">asdf</li>
                <li class="list-group-item draggable">bbq</li>
            </ul>
        </div>
    </div>
    <div class="rightStuff panel">
        <div class="panel-heading">
            <h4 class="panel-title">Drop Areas</h4>
        </div>
        <div class="panel-body">
            <div class="dropzone">drop stuff here</div>
            <div class="dropzone">drop more stuff here</div>
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



<!-- Configuration-->
<script src="frameworks/js/interact.min.js"></script>     

<!-- Configuration-->
<script src="frameworks/js/interact.js"></script>     




    </body>
</html>