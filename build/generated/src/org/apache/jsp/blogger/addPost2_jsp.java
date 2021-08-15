package org.apache.jsp.blogger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.daos.CategoryDao;
import java.util.ArrayList;
import com.beans.Category;
import com.beans.Blogger;

public final class addPost2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">  \n");
      out.write("    <title>Visual Blogger Dashboard - Home</title>\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"templatemo\">\n");
      out.write("    <!-- \n");
      out.write("    Visual Admin Template\n");
      out.write("    https://templatemo.com/tm-455-visual-admin\n");
      out.write("    -->\n");
      out.write("    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>\n");
      out.write("    <link href=\"assets/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"assets/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"assets/css/templatemo-style.css\" rel=\"stylesheet\">\n");
      out.write("    \n");
      out.write("<script>\n");
      out.write("        function readURL(input) {\n");
      out.write("            if(input.files && input.files[0]){\n");
      out.write("                var reader = new FileReader();\n");
      out.write("                \n");
      out.write("                reader.onload = function (e) {\n");
      out.write("                    preview.src = e.target.result;\n");
      out.write("                };\n");
      out.write("                \n");
      out.write("                reader.readAsDataURL(input.files[0]);\n");
      out.write("    \n");
      out.write("           }            \n");
      out.write("       }\n");
      out.write("          \n");
      out.write("  \n");
      out.write("    </script>\n");
      out.write("  </head>\n");
      out.write("  <body>  \n");
      out.write("      ");

          Blogger blogger = (Blogger)session.getAttribute("blogger");
          if(blogger == null){
              response.sendRedirect("../blogin.jsp?errorMessage=Session Expired! please Login Again");
              return;
          }
      
      out.write("\n");
      out.write("    <!-- Left column -->\n");
      out.write("    <div class=\"templatemo-flex-row\">\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "sidebar.jsp", out, false);
      out.write("\n");
      out.write("      <!-- Main content --> \n");
      out.write("      <div class=\"templatemo-content col-1 light-gray-bg\">\n");
      out.write("      ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"templatemo-block-container\">\n");
      out.write("          \n");
      out.write("           \n");
      out.write("             ");
 
              String[] categories = request.getParameterValues("category");
              session.setAttribute("categories", categories);

            
      out.write("\n");
      out.write("        <div class=\"navbar bg-secondary text-white\" >\n");
      out.write("              <center><h2>Upload profile Picture </h2></center>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col col-md-12 col-sm-12 col-lg-12\">\n");
      out.write("                    <center>\n");
      out.write("                        <form action=\"BloggerController?op=add\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                        <img src=\"\" id=\"preview\" style=\"width: 300px; height: 400px; border-radius: 10px;border-style: solid;\">\n");
      out.write("                        <br/><br/>\n");
      out.write("                        <input type=\"file\" name=\"pic\" id=\"pic\" onchange=\"readURL(this)\" class=\"btn btn-secondary\"/>\n");
      out.write("                        <br/><br>\n");
      out.write("                        <input type=\"submit\" name=\"submit\" value=\"Proceed to save\" class=\"btn btn-primary\" />\n");
      out.write("                        \n");
      out.write("                        </form>\n");
      out.write("                    </center>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("        \n");
      out.write("            \n");
      out.write("          \n");
      out.write("                  \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <!-- JS -->\n");
      out.write("    <script src=\"assets/js/jquery-1.11.2.min.js\"></script>      <!-- jQuery -->\n");
      out.write("    <script src=\"assets/js/jquery-migrate-1.2.1.min.js\"></script> <!--  jQuery Migrate Plugin -->\n");
      out.write("    <script src=\"https://www.google.com/jsapi\"></script> <!-- Google Chart -->\n");
      out.write("    <script>\n");
      out.write("      /* Google Chart \n");
      out.write("      -------------------------------------------------------------------*/\n");
      out.write("      // Load the Visualization API and the piechart package.\n");
      out.write("      google.load('visualization', '1.0', {'packages':['corechart']});\n");
      out.write("\n");
      out.write("      // Set a callback to run when the Google Visualization API is loaded.\n");
      out.write("      google.setOnLoadCallback(drawChart); \n");
      out.write("      \n");
      out.write("      // Callback that creates and populates a data table,\n");
      out.write("      // instantiates the pie chart, passes in the data and\n");
      out.write("      // draws it.\n");
      out.write("      function drawChart() {\n");
      out.write("\n");
      out.write("          // Create the data table.\n");
      out.write("          var data = new google.visualization.DataTable();\n");
      out.write("          data.addColumn('string', 'Topping');\n");
      out.write("          data.addColumn('number', 'Slices');\n");
      out.write("          data.addRows([\n");
      out.write("            ['Mushrooms', 3],\n");
      out.write("            ['Onions', 1],\n");
      out.write("            ['Olives', 1],\n");
      out.write("            ['Zucchini', 1],\n");
      out.write("            ['Pepperoni', 2]\n");
      out.write("          ]);\n");
      out.write("\n");
      out.write("          // Set chart options\n");
      out.write("          var options = {'title':'How Much Pizza I Ate Last Night'};\n");
      out.write("\n");
      out.write("          // Instantiate and draw our chart, passing in some options.\n");
      out.write("          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));\n");
      out.write("          pieChart.draw(data, options);\n");
      out.write("\n");
      out.write("          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));\n");
      out.write("          barChart.draw(data, options);\n");
      out.write("      }\n");
      out.write("\n");
      out.write("      $(document).ready(function(){\n");
      out.write("        if($.browser.mozilla) {\n");
      out.write("          //refresh page on browser resize\n");
      out.write("          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/\n");
      out.write("          $(window).bind('resize', function(e)\n");
      out.write("          {\n");
      out.write("            if (window.RT) clearTimeout(window.RT);\n");
      out.write("            window.RT = setTimeout(function()\n");
      out.write("            {\n");
      out.write("              this.location.reload(false); /* false to get page from cache */\n");
      out.write("            }, 200);\n");
      out.write("          });      \n");
      out.write("        } else {\n");
      out.write("          $(window).resize(function(){\n");
      out.write("            drawChart();\n");
      out.write("          });  \n");
      out.write("        }   \n");
      out.write("      });\n");
      out.write("      \n");
      out.write("    </script>\n");
      out.write("    <script type=\"text/javascript\" src=\"js/templatemo-script.js\"></script>      <!-- Templatemo Script -->\n");
      out.write("\n");
      out.write("  </body>\n");
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
