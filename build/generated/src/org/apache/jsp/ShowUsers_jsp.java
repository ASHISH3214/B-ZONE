package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import com.daos.UserDao;
import com.db.DataConnection;
import com.beans.User;
import java.sql.*;

public final class ShowUsers_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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

      out.write("\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n");
      out.write("       \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link href=\"assets/css/bootstrap.min.css\" type=\"text/css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"assets/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <style>\n");
      out.write("            a{\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            function show(){\n");
      out.write("                if(confirm(\"do you want to delete? \"))\n");
      out.write("                    return true;\n");
      out.write("                else\n");
      out.write("                    return false;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col col-sm-12 col-md-12\">\n");
      out.write("        <h1>List Of Users</h1>\n");
      out.write("        <br/>\n");
      out.write("        <table class=\"table\">\n");
      out.write("            <tr>\n");
      out.write("                <th>ID</th>\n");
      out.write("                <th>Name</th>\n");
      out.write("                <th>Userid</th>\n");
      out.write("                <th>Age</th>\n");
      out.write("                <th>Gender</th>\n");
      out.write("                <th>Hobbies</th>\n");
      out.write("                <th>Pic</th>\n");
      out.write("                <th>Operations</th>\n");
      out.write("            </tr>\n");
      out.write("            ");

                UserDao ud = new UserDao();
                ArrayList<User> userlist = ud.getAllRecords();
                for(User user : userlist){
      out.write("\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(user.getId());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(user.getName());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(user.getUserid());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(user.getAge());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(user.getGender());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(user.getHobbies());
      out.write("</td>\n");
      out.write("                    <td><img src=\"");
      out.print(user.getPic());
      out.write("\" style=\"width: 60px;height:80px;\"/></td>\n");
      out.write("                    <td>\n");
      out.write("                        <a href=\"#\" class=\"btn btn-success\">Edit</a>\n");
      out.write("                        <a href=\"#\" class=\"btn btn-danger\">Delete</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                \n");
      out.write("        </table>\n");
      out.write("         <br/><br/>\n");
      out.write("            <a href=\"AddNew.jsp\" class=\" btn btn-primary\">Add more Record</a>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </body>  \n");
      out.write("</html>\n");
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
