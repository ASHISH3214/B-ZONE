package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.beans.Blog;
import com.daos.CategoryDao;
import com.beans.Category;
import java.util.ArrayList;
import com.daos.BlogDao;
import com.beans.Comment;

public final class sidebar1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("    .current{\n");
      out.write("        border-style: solid;\n");
      out.write("        border-radius: 3px;\n");
      out.write("        background-color: lightgray;\n");
      out.write("        font-weight: bold;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("<div class=\"col-lg-4\">\n");
      out.write("            <div class=\"sidebar\">\n");
      out.write("              <div class=\"row\">\n");
      out.write("                \n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                  <div class=\"sidebar-item recent-posts\">\n");
      out.write("                    \n");
      out.write("                    <div class=\"content\">\n");
      out.write("                        <h2> Write Comments </h2>\n");
      out.write("                        <form  method=\"post\" class=\"form-group\">\n");
      out.write("                         Enter Your Name\n");
      out.write("                         <input type=\"text\" name=\"userName\" class=\"form-control\"/>\n");
      out.write("                         Write Comment\n");
      out.write("                         <textarea name=\"description\" rows=\"10\" cols=\"20\" class=\"form-control\"></textarea>\n");
      out.write("                         \n");
      out.write("                         <input type=\"hidden\" name=\"blogId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${blog.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                         <input type=\"hidden\" name=\"bloggerId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${blog.bloggerId}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                         <input type=\"submit\" class=\"btn btn-primary form-control\" />\n");
      out.write("                         \n");
      out.write("                        </form>\n");
      out.write("                          ");

                             if(request.getParameter("submit")!=null){
      out.write("\n");
      out.write("                             ");
      com.beans.Comment comment = null;
      synchronized (request) {
        comment = (com.beans.Comment) _jspx_page_context.getAttribute("comment", PageContext.REQUEST_SCOPE);
        if (comment == null){
          comment = new com.beans.Comment();
          _jspx_page_context.setAttribute("comment", comment, PageContext.REQUEST_SCOPE);
        }
      }
      out.write("\n");
      out.write("                             ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("comment"), request);
      out.write("\n");
      out.write("                            \n");
      out.write("                             ");
 RequestDispatcher rd =  request.getRequestDispatcher("CommentController?op=add");
                                rd.forward(request, response);
                               }
                             
                             
      out.write("\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                  <div class=\"sidebar-item categories\">\n");
      out.write("                    <div class=\"sidebar-heading\">\n");
      out.write("                      <h2>Another Comments and Replies</h2>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"content\">\n");
      out.write("                      \n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-12\">\n");
      out.write("                  <div class=\"sidebar-item tags\">\n");
      out.write("                   \n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
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
