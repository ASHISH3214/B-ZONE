package org.apache.jsp.test;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script src=\"../assets/js/jQuery.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("             \n");
      out.write("            //$(\"p\").hide();\n");
      out.write("            $(\"p\").hide();\n");
      out.write("        });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <button id=\"b1\">Show</button>\n");
      out.write("        <br/>\n");
      out.write("        <button id=\"b2\">hide</button>\n");
      out.write("        <br/>\n");
      out.write("        <button id=\"b3\">hide/show</button>\n");
      out.write("        \n");
      out.write("        <br/>\n");
      out.write("        <p id=\"p1\" style=\"width: 200px;height: 100px;border: 2px solid blueviolet\">This is first para -1</p>\n");
      out.write("        <p id=\"p2\" style=\"width: 200px;height: 100px;border: 2px solid #D8D138\">This is second para -2</p>\n");
      out.write("        <hr/>\n");
      out.write("        \n");
      out.write("        <button id=\"b4\">Slide Toggle</button>\n");
      out.write("        <div id=\"d1\" style=\"width: 300px;height: 200px;background-color: green;color: blanchedalmond\">\n");
      out.write("            get ready to fight.<br/>\n");
      out.write("            get ready to fight.<br/>\n");
      out.write("            get ready to fight.<br/>\n");
      out.write("            get ready to fight.<br/>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            $(\"#b1\").click(function (){\n");
      out.write("                \n");
      out.write("               $(\"p\").show(200,function(){\n");
      out.write("                   alert(\"paragraph visible\")});\n");
      out.write("    \n");
      out.write("                 }); \n");
      out.write("                       \n");
      out.write("            $(\"#b2\").click(function (){\n");
      out.write("                //alert(\"paregraph hidden\");\n");
      out.write("               $(\"p\").hide(200,function(){\n");
      out.write("                   alert(\"paragraph hidden\")});\n");
      out.write("               }); \n");
      out.write("            $(\"#b3\").click(function() {\n");
      out.write("               //$(\"p\").toggle(500);\n");
      out.write("               $(\"p\").fadeToggle(500);\n");
      out.write("                          \n");
      out.write("               });\n");
      out.write("            $(\"#b4\").click(function() {\n");
      out.write("               //$(\"p\").toggle(500);\n");
      out.write("               $(\"#d1\").slideToggle(500);\n");
      out.write("           });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
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
