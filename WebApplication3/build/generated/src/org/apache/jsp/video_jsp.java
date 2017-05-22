package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class video_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            Connection conn,conn1;
            PreparedStatement pstmt,pstmt1;
            Statement stmt;
            ResultSet result;
            String qry,qry1;
            Integer videoID;
            Integer z = 0;  
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html data-ng-app=\"myApp\">\r\n");
      out.write("<head>\r\n");
      out.write("                \r\n");
      out.write("<!-- Description: Game of Quiz -->\r\n");
      out.write("<!-- Author: Eileen Kho, Leslie Ling, Ting Lee Ting -->\r\n");
      out.write("<!-- Last update: 2017-->\r\n");
      out.write("    \r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>JSP Page</title>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initialscale=1.0\"/>\r\n");
      out.write("<!-- Bootstrap -->\r\n");
      out.write("<link href=\"frameworks/css/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("<!-- StyleSheet -->\r\n");
      out.write("<link href=\"frameworks/css/style.css\" rel=\"stylesheet\" />\r\n");
      out.write("<!-- StyleSheet -->\r\n");
      out.write("<link href=\"languages.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\r\n");
      out.write("<!--[if lt IE 9]>\r\n");
      out.write("<script src=\"js/html5shiv.js\"></script>\r\n");
      out.write("<script src=\"js/respond.min.js\"></script>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("        \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\"> <!--1-->\r\n");
      out.write("            <div class=\"col-xs-12 col-md-12 col-lg-12 jumbotron\"> <!--1.1-->\r\n");
      out.write("                <p>EQUILIBRA</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"row\"><!--2-->\r\n");
      out.write("            <div class=\"col-xs-12 col-md-12 col-lg-12 catbuttoncontainer\"> <!--2.1-->\r\n");
      out.write("                <button data-ng-click=\"biology=true; english=false\" class=\"catbtn btn-lg\">Biology</button>\r\n");
      out.write("                <button data-ng-click=\"english=true; biology=false\" class=\"catbtn btn-lg\">English</button>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"row\"><!--3-->\r\n");
      out.write("            <div class=\"col-xs-12 col-md-12 col-lg-12\"><!--3.1-->\r\n");
      out.write("                <div data-ng-show=\"biology\">\r\n");
      out.write("                    <h1>Biology</h1>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div data-ng-show=\"english\">\r\n");
      out.write("                    <h1>English</h1>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"row\"><!--4-->\r\n");
      out.write("            <div class=\"col-xs-12 col-md-12 col-lg-12\"><!--4.1-->\r\n");
      out.write("            <div data-ng-show=\"biology\">\r\n");
      out.write("                ");

                    while(result.next() && (result.getString("category").equalsIgnoreCase("biology"))) {
                
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"videocontainer\">\r\n");
      out.write("                    <div class=\"row\"><!--4.1.1-->\r\n");
      out.write("                        <div class=\"col-xs-12 col-md-12 col-lg-12\"><!--4.1.1.1-->\r\n");
      out.write("                            <h2>");
      out.print(result.getString("videoName") );
      out.write("</h2>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                        \r\n");
      out.write("                    <div class=\"row\"><!--4.1.2-->\r\n");
      out.write("                        <div class=\"col-xs-4 col-md-4 col-lg-4\"><!--4.1.2.1-->\r\n");
      out.write("                            <video width=\"100%\" height=\"100%\" controls>\r\n");
      out.write("                                <source src=\"");
      out.print(result.getString("videoPath"));
      out.write("\" type=\"video/wmv\">\r\n");
      out.write("                            </video>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-xs-6 col-md-6 col-lg-6\"><!--4.1.2.2-->\r\n");
      out.write("                            <p>");
      out.print(result.getString("videoDesc") );
      out.write("</p>\r\n");
      out.write("                        </div>            \r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-xs-2 col-md-2 col-lg-2 quizbtncont\"> <!--4.1.2.3-->\r\n");
      out.write("                            <a href=\"index.html\"><button class=\"btn-lg btnplay\">Create quiz</button></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                        }
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div data-ng-show=\"english\">\r\n");
      out.write("                ");

                    while(result.next() && (result.getString("category").equalsIgnoreCase("english"))) {
                
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"videocontainer\">\r\n");
      out.write("                    <div class=\"row\"> <!--4.1.1-->\r\n");
      out.write("                        <div class=\"col-xs-12 col-md-12 col-lg-12\"><!--4.1.1.1-->\r\n");
      out.write("                            <h2>");
      out.print(result.getString("videoName") );
      out.write("</h2>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                        \r\n");
      out.write("                    <div class=\"row\"><!--4.1.2-->\r\n");
      out.write("                        <div class=\"col-xs-4 col-md-4 col-lg-4\"><!--4.1.2.1-->\r\n");
      out.write("                            <video width=\"100%\" height=\"100%\" controls>\r\n");
      out.write("                                <source src=\"");
      out.print(result.getString("videoPath") );
      out.write("\" type=\"video/wmv\">\r\n");
      out.write("                            </video>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-xs-6 col-md-6 col-lg-6\"><!--4.1.2.2-->\r\n");
      out.write("                            <p>");
      out.print(result.getString("videoDesc") );
      out.write("</p>\r\n");
      out.write("                        </div>            \r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-xs-2 col-md-2 col-lg-2 quizbtncont\"><!--4.1.2.3-->\r\n");
      out.write("                            <a href=\"index.html\"><button class=\"btn-lg btnplay\">Create quiz</button></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                        }
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("<!-- jQuery – required for Bootstrap's JavaScript plugins) -->\r\n");
      out.write("<script src=\"frameworks/js/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- All Bootstrap plug-ins file -->\r\n");
      out.write("<script src=\"frameworks/js/bootstrap.min.js\"></script>\r\n");
      out.write("    \r\n");
      out.write("<!-- Basic AngularJS-->\r\n");
      out.write("<script src=\"frameworks/js/angular.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("<!-- Angular-route-->\r\n");
      out.write("<script src=\"frameworks/js/angular-route.min.js\"></script>   \r\n");
      out.write("\r\n");
      out.write("<!-- Configuration-->\r\n");
      out.write("<script src=\"frameworks/js/gameOQ.js\"></script>    \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
