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

<style>
    
    
</style>

</head>

<body>
       <%!
            Connection conn;
            PreparedStatement pstmt;
            Statement stmt;
            ResultSet result,result1;
            String qry,qry1;
            Integer quizID;
            Integer z = 0;  
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
    
    <div class="row"><!--3--> 
        <div class="col-xs-12 col-md-12 col-lg-12 parallax"> <!--3.1--> 
            <h1>PUSH YOURSELF <br/>BECAUSE <br/>NO ONE ELSE <br/>IS GOING TO <br/>DO IT FOR <br/>YOU</h1><hr/>
            <p>SO TAKE THE QUIZ</p><br/>
            <h2 class="glyphicon glyphicon-download"></h2>
        </div>
    </div>
 
    <div class="row"><!--4--> 
        <div class="col-xs-12 col-md-12 col-lg-12"><!--4.1--> 
        <%
        while(result.next() ) {
            quizID = result.getInt("quizID");  
            z++;
        %> 
  
        <!--display quiz question-->
        <div id="<%=result.getInt("questionID") %>" class="questioncontainer">
            <h2> Question <% out.println(z); %></h2> <hr/>
            <h3><%=result.getString("question") %></h3>
        </div> 
    
        <div class="container2">
            <!-- Format for multiple choice -->
            <div data-ng-if="'<%=result.getString("type")%>' === 'M'">
                <form name="form1">
                    <ul class="left answercontainer">
                        <li><input type="radio" data-ng-model="checkeds" value="A" required/> <%=result.getString("input1") %></li>
                        <li><input type="radio" data-ng-model="checkeds" value="B" /> <%=result.getString("input2") %></li>
                        <li><input type="radio" data-ng-model="checkeds" value="C" /> <%=result.getString("input3") %></li>
                        <li><input type="radio" data-ng-model="checkeds" value="D" /> <%=result.getString("input4") %></li>
                    </ul>
                    
                    <p class="hint" data-ng-show="scopeVar"><%=result.getString("hints") %></p>
                    <a class="glyphicon glyphicon-eye-open pull-right" type="button" data-ng-click="scopeVar=scopeVar!==true">Hints</a><br/>
                    
                    <div class="row"><!--4.1.1--> 
                        <div class="col-xs-6 col-md-6 col-lg-6 " ><!--4.1.2--> 
                            <button class="btn btn-block full-width" data-ng-click="show = 1; count = count+1" data-ng-init="0" data-ng-disabled="form1.$invalid" onClick="checkansSound()">Check</button>
                        </div>
                        
                        <div class="col-xs-6 col-md-6 col-lg-6 "><!--4.1.3-->
                            <button class="btn btn-block full-width" data-ng-click="show = 2" onClick="giveupSound()">Give Up</button>  
                        </div> 
                    </div>    
                </form>  
                 
                <!-- check answer-->
                <div data-ng-show="show === 1" class="checkanswer">
                    <div data-ng-if="checkeds === '<%=result.getString("checked")%>'" >
                        <span class="glyphicon glyphicon-star yellow"></span>
                        <hr class="correct">
                        <span class="yellow"><h3>Correct</h3></span> 
                        <div data-ng-if="count === 5 ">
                            <p>Congratulation!!! Heres your topic (Quote) bonus!!</p>
                            <button data-toggle="modal" data-target="#BonusModal">Quote Bonus</button>

                        </div> 
                    </div>
                    <div data-ng-if="checkeds !== '<%=result.getString("checked")%>'">
                        <span class="glyphicon glyphicon-star"></span>
                        <hr class="incorrect">
                        <span><p>Incorrect</p></span>
                    </div>
                </div>
                        
                <!-- Show answer -->
                <div data-ng-show="show === 2" class="showanswer">
                    <b>Answer: <%=result.getString("checked")%></b>
                </div> 
                
              
            </div>
                
            <!-- Format for Fill in the Blank -->
            <div data-ng-if="'<%=result.getString("type")%>' === 'B'">
                <ul class=" hint answercontainer">
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
                    <h4>Answer:</h4>
                    <input type="text" name="answer" data-ng-model="checkeds" required/><br/>
                    
                    <p class="hint" data-ng-show="scopeVar"><%=result.getString("hints") %></p>
                    <a class="glyphicon glyphicon-eye-open pull-right" type="button" data-ng-click="scopeVar=scopeVar!==true">Hints</a><br/>

                    <div class="row"><!--4.1.1--> 
                        <div class="col-xs-6 col-md-6 col-lg-6 " ><!--4.1.2--> 
                            <button class="btn btn-block full-width" data-ng-click="show = 3; count = count+1" data-ng-disabled="form2.$invalid" onClick="checkansSound()">Check</button>
                        </div>
                        <div class="col-xs-6 col-md-6 col-lg-6 "><!--4.1.3-->
                            <button class="btn btn-block full-width" data-ng-click="show = 4" onClick="giveupSound()">Give Up</button>  
                        </div> 
                    </div>                 
                </form>
                    
                <!-- check answer-->
                <div data-ng-show="show === 3" class="checkanswer">
                    <div data-ng-if="checkeds === '<%=result.getString("checked")%>'" >
                        <span class="glyphicon glyphicon-star yellow"></span>
                        <hr class="correct">
                        <span class="yellow"><h3>Correct</h3></span>
                        <div data-ng-if="count === 5 ">
                            <button>Claim reward</button>
                        </div>
                    </div>
                    <div data-ng-if="checkeds !== '<%=result.getString("checked")%>'">
                        <span class="glyphicon glyphicon-star"></span>
                        <hr class="incorrect">
                        <span><p>Incorrect</p></span>
                    </div>
                </div>
                        
                <!-- Show answer -->
                <div data-ng-show="show === 4" class="showanswer">
                    <b>Answer: <%=result.getString("checked")%></b>
                </div>

            </div> 
        </div>
        <%
            } 
        %>
        </div> 
    </div>  
      
    <div class="row"><!--5--> 
        <div class="col-xs-4 col-md-4 col-lg-4"> <!--5.1 --> 
            <a href="index.html" class="back">Back To Topic</a>
        </div>
        <div class="col-xs-4 col-md-4 col-lg-4"><!--5.2 -->
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
        <div class="col-xs-4 col-md-4 col-lg-4"><!--5.3 --> 
            <a class="glyphicon glyphicon-hand-up pull-right report" data-ng-click="report=report!==true">Report a problem</a>
            
            <!--mayb make it as modal?c1st-->     
            <div data-ng-show="report">
            <form>
                <legend>What's wrong?</legend>
                <div class="form-group">
                    <input type="checkbox" value="wrong Ans" />Wrong answer(s).
                </div>
                <div class="form-group">
                    <input type="checkbox" value="hint is confusing/wrong" />Confusing/wrong hint(s).
                </div>
                <div class="form-group">
                    <input type="checkbox" value="typo error" />Typo error(s).
                </div> 
                <div class="form-group">
                    <p>others:</p><textarea name="field6" class="textarea-field"></textarea>
                </div>

                <label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
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




                            
                
                
                        
