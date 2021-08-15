<%-- 
    Document   : sidebar1
    Created on : 15 Jun, 2021, 11:26:25 AM
    Author     : HP
--%>
<%@page import="com.daos.CommentDao"%>
<%@page import="com.beans.Blog"%>
<%@page import="com.daos.CategoryDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.BlogDao"%>
<%@page import="com.beans.Comment"%>


<style>
    .current{
        border-style: solid;
        border-radius: 3px;
        background-color: lightgray;
        font-weight: bold;
    }
</style>
<div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
                
                <div class="col-lg-12">
                  <div class="sidebar-item recent-posts">
                    
                    <div class="content">
                        <h2> Write Comments </h2>
                        <form action="CommentController?op=add" method="post"  class="form-group">
                         Enter Your Name
                         <input type="text" name="userName" class="form-control"/>
                         Write Comment
                         <textarea name="description" rows="10" cols="20" class="form-control"></textarea>
                         
                         <input type="hidden" name="blogId" value="${blog.id}"/>
                         <input type="hidden" name="bloggerId" value="${blog.bloggerId}"/>
                         <input type="submit" name="submit" class="btn btn-primary form-control" />
                         
                        </form>
                          
                        
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item categories">
                    <div class="sidebar-heading">
                      <h2>Another Comments and Replies</h2>
                    </div>
                      <%
                        CommentDao cd = new CommentDao();
                        ArrayList<Comment> commentList = cd.getAllCommentByBlogId(Integer.parseInt(request.getParameter("id")));
                        for(Comment comment : commentList) 
                         
                          {%>
                         <div class="content bg-secondary" style="border-radius: 16px;" >
                         
                             <p style="font-family: corbel;color: white; font-size: 16px;"><b>User : <%=comment.getUserName()%></b> <br/>
                             <%=comment.getDescription()%>
                             </p>
                             <p style="margin-left: 50px; font-family: corbel;color: wheat; font-size: 16px;">
                             <b>Blogger's Reply: </b>
                             <%=comment.getReply()%>
                             </p>
                    </div>
                        <br/>
                     <%} %>
                     
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item tags">
                   
                  </div>
                </div>
              </div>
            </div>
          </div>
