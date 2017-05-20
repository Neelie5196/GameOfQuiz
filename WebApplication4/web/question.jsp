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
<link href="style.css" rel="stylesheet" />
<!-- StyleSheet -->
<link href="languages.min.css" rel="stylesheet" />


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
       <%!
            Connection conn,conn1;
            PreparedStatement pstmt,pstmt1;
            Statement stmt;
            ResultSet result;
            String qry,qry1;
            Integer quizID;
            Integer z = 0;  
        %>

        <%-- READ function for question--%>
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
                z++;
            }catch(ClassNotFoundException cnfe){
                out.println("Class not Found Execption:-" + cnfe.toString());
            }catch(SQLException sqle){
                out.println("SQL Query Exception:- " + sqle);
            } 
            }else{
                response.sendRedirect("./index.html");
            }
        %>
        
        <%-- CREATE function for feeback--%>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
            quizID = Integer.parseInt(request.getParameter("id"));
            if(request.getParameter("btnAdd") != null){
                try{
                    Class.forName("com.mysql.jdbc.Driver");

                    qry = "INSERT INTO feedback(quizID, select, feedback) VALUES(?,?,?)";
                    pstmt = conn.prepareStatement(qry);
                    pstmt.setInt(1, quizID);
                    pstmt.setString(2,request.getParameter("txtselect"));
                    pstmt.setString(3,request.getParameter("txtfeedback"));
                    
                    pstmt.executeUpdate();
                    response.sendRedirect("./question.jsp");
                }catch(ClassNotFoundException cnfe){
                    out.println("Class not Found Execption:-" + cnfe.toString());
                }catch(SQLException sqle){
                    out.println("SQL Query Exception:- " + sqle);
                }
            } 
        %>
    
    <div class="row"><!--1--> 
        <div class="col-xs-12 col-md-12 col-lg-12 parallax"> <!--1.1--> 
            <h1>PUSH YOURSELF <br/>BECAUSE <br/>NO ONE ELSE <br/>IS GOING TO <br/>DO IT FOR <br/>YOU</h1><hr/>
            <p>SO TAKE THE QUIZ</p><br/>
            <a data-toggle="modal" data-target="#myModal" >
                <!-- image obtained from http://misstingtingwu.blogspot.my/ --> 
                <img src="resources/img/cat.gif" class="cat" alt="click me" onClick="meowSound()"/>
            </a>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content catnote">
                <b>Thanks for noticing me human!</b><br/><br/>
                <h3 class="yellow"><span class="glyphicon glyphicon-star-empty yellow"</span> Reward <span class="glyphicon glyphicon-star-empty yellow"</span></h3><br/>
                <b>Go answer any quiz and click the check button for</b><p>exactly V times</p><b>You will get what you</b><br/><br/><b> DESERVED</b>
                <div class="catpawn">
                <p>Regards,</p>
                <img src="resources/img/catpawn.png"></div>
            </div>
            </div>
            </div>
        </div>
    </div>
 
    <div class="row"><!--2--> 
        <div class="col-xs-12 col-md-12 col-lg-12"><!--2.1--> 
        <%
            Integer questionNo = 1;
            while(result.next() ) {
                quizID = result.getInt("quizID");  
        %> 
        
        <!--display quiz question-->
        <div id="<%=result.getInt("questionID") %>" class="questioncontainer">
            <h2> Question <%=questionNo%></h2> <hr/>
            <h3><%=result.getString("question") %></h3>
        </div> 
    
        <div class="container2">
            <!-- Format for multiple choice -->
            <div data-ng-if="'<%=result.getString("type")%>' === 'M'">
                <form name="form1">
                    <ul class="answercontainer">
                        <li class="rowinput" ><input type="radio" data-ng-model="checkeds" value="A" name="multiradio" required/> <%=result.getString("input1") %></li>
                        <li class="rowinput" ><input type="radio" data-ng-model="checkeds" value="B" name="multiradio" /> <%=result.getString("input2") %></li>
                        <li class="rowinput" ><input type="radio" data-ng-model="checkeds" value="C" name="multiradio" /> <%=result.getString("input3") %></li>
                        <li class="rowinput" ><input type="radio" data-ng-model="checkeds" value="D" name="multiradio" /> <%=result.getString("input4") %></li>
                    </ul>

                    <div class=" hintrow"> 
                        <p class="hint" data-ng-show="scopeVar"><%=result.getString("hints") %></p>
                        <a class="hinticon glyphicon glyphicon glyphicon-search" type="button" data-ng-click="scopeVar=scopeVar!==true"></a><br/>
                    </div>
                   
                    <div class="row"><!--2.1.1-->
                        <div class="col-xs-6 col-md-6 col-lg-6 full-width1" ><!--2.1.1.1-->
                            <button class="btn btn-primary btn-lg givecheckbutton" data-ng-click="show = 1; count = count+1" data-ng-init="0" data-ng-disabled="form1.$invalid" onClick="checkansSound()">Check</button>
                        </div>
                        <div class="col-xs-6 col-md-6 col-lg-6 full-width2"><!--2.1.1.2-->
                            <button class="btn btn-danger btn-lg givecheckbutton" data-ng-click="show = 2" onClick="giveupSound()">Give Up</button>  
                        </div> 
                    </div>    
                </form>  
                 
                <!-- check answer-->
                <div data-ng-show="show === 1" class="checkshowanswer">
                    <!-- correct -->
                    <div data-ng-if="checkeds === '<%=result.getString("checked")%>'" >
                        <span class="glyphicon glyphicon-star yellow"></span>
                        <hr class="correct">
                        <span class="yellow"><h3>Correct</h3></span>
                        <b>Explanation in detail:</b>
                        <p><%=result.getString("explanation")%></p>
                        <div data-ng-if="count === 5 ">
                            <b>Congratulation!!! Here is your topic (Quote) bonus!!</b><br/>
                            <a href="bonus.jsp?id=<%=quizID%>" data-ng-click="bonusSound()">Quote Bonus</a>
                            <button onClick="bonusSound()">Quote Bonus</button>
                        </div> 
                    </div>
                    <!-- incorrect -->
                    <div data-ng-if="checkeds !== '<%=result.getString("checked")%>'">
                        <span class="glyphicon glyphicon-star"></span>
                        <hr class="incorrect">
                        <p>Incorrect. You can try again</p>
                    </div>
                </div>
                        
                <!-- Show answer -->
                <div data-ng-show="show === 2" class="checkshowanswer">
                    <b class="answer">Answer: <%=result.getString("checked")%></b><br/>
                    <b>Explanation in detail:</b>
                    <p><%=result.getString("explanation")%></p>
                </div> 
            </div>
                
            <!-- Format for Fill in the Blank -->
            <div data-ng-if="'<%=result.getString("type")%>' === 'B'">
                <ul class="hint answercontainer">
                    <li>
                        <span><%=result.getString("input1") %></span>
                        <span class="tab"><%=result.getString("input2") %></span>
                        <span class="tab"><%=result.getString("input3") %></span>
                        <span class="tab"><%=result.getString("input4") %></span>
                    </li>
                </ul>
            </div>
                
            <!-- User input for Fill in the Blank & True False -->
            <div data-ng-if="'<%=result.getString("type")%>' === 'B' || '<%=result.getString("type")%>' === 'T'">
                <form name="form2">
                    <div class="rowinput">
                        <h4>Answer:</h4>
                        <input type="text" name="answer" data-ng-model="checkeds" required/><br/>
                    </div>
                    <div class="hintrow">
                        <p class="hint" data-ng-show="scopeVar"><%=result.getString("hints") %></p>
                        <a class="hinticon glyphicon glyphicon glyphicon-search" type="button" data-ng-click="scopeVar=scopeVar!==true"></a><br/>      
                    </div>
                    
                    <div class="row"><!--2.1.2-->
                        <div class="col-xs-6 col-md-6 col-lg-6 full-width1"><!--2.1.2.1--> 
                            <button class="btn btn-primary btn-lg givecheckbutton" data-ng-click="show = 3; count = count+1" data-ng-init="0" data-ng-disabled="form2.$invalid" onClick="checkansSound()">Check</button>
                        </div>
                        <div class="col-xs-6 col-md-6 col-lg-6 full-width2"><!--2.1.2.2-->
                            <button class="btn btn-danger btn-lg givecheckbutton" data-ng-click="show = 4" onClick="giveupSound()">Give Up</button>  
                        </div> 
                    </div>                  
                </form>
                    
                <!-- check answer-->
                <div data-ng-show="show === 3" class="checkshowanswer">
                    <!-- correct -->
                    <div data-ng-if="checkeds === '<%=result.getString("checked")%>'" >
                        <span class="glyphicon glyphicon-star yellow"></span>
                        <hr class="correct">
                        <span class="yellow"><h3>Correct</h3></span>
                        <b>Explanation in detail:</b>
                        <p><%=result.getString("explanation")%></p>
                        <div data-ng-if="count === 5 ">
                            <b>Congratulation!!! Here is your topic (Quote) bonus!!</b><br/>
                            <a href="bonus.jsp?id=<%=quizID%>" data-ng-click="bonusSound()">Quote Bonus</a>
                        </div>
                    </div>
                    <!-- incorrect -->
                    <div data-ng-if="checkeds !== '<%=result.getString("checked")%>'">
                        <span class="glyphicon glyphicon-star"></span>
                        <hr class="incorrect">
                        <p>Incorrect. You can try again</p>>
                    </div>
                </div>
                        
                <!-- Show answer -->
                <div data-ng-show="show === 4" class="checkshowanswer">
                    <b class="answer">Answer: <%=result.getString("checked")%></b><br/>
                    <b>Explanation in detail:</b>
                    <p><%=result.getString("explanation")%></p>
                </div>
            </div> 
        </div>
        <%
            questionNo++;
            } 
        %>
        </div> 
    </div>  
      
    <div class="row footer"><!--3--> 
        <div class="col-xs-6 col-md-6 col-lg-6"> <!--3.1 --> 
            <a href="index.html" class="btn btn-primary">Back To Topic</a>
        </div>
        <div class="col-xs-6 col-md-6 col-lg-6"><!--3.2 -->
            <a class=" pull-right btn btn-primary" data-ng-click="report=report!==true">Report a problem</a>
            
            <!--mayb make it as modal?c1st-->     
            <div data-ng-show="report">
            <form id="addForm" action="" method="POST">
                <input type="hidden" name="hiddenId" id="hiddenId" value="<%=quizID%>"/> 
                <legend>What's wrong?</legend>
                    <input type="radio" name="txtselect" value="wrong Ans" />Wrong answer(s).
                    <input type="radio" name="txtselect" value="confusing/wrong hints" />Confusing/wrong hint(s).
                    <input type="radio" name="txtselect" value="typo error" />Typo error(s).
                
                <p>others:</p><textarea name="txtfeedback"></textarea>
                <button type="submit" name="btnAdd">Submit</button>
            </form>
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




                            
                
                
                        
