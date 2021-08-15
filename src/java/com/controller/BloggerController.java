/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.beans.Blogger;
import com.daos.BloggerDao;
import com.sun.imageio.plugins.common.ImageUtil;
import com.util.ImageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringEscapeUtils;

/**
 *
 * @author HP
 */
public class BloggerController extends HttpServlet {


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        
        if(op!=null && op.equals("checkuserid")){
            String userid = request.getParameter("userid");
            BloggerDao bd = new BloggerDao();
            if(bd.isUseridExist(userid))
                out.println("<font color='red'><b>This UserID Already Exist</b></font>");
            else
                 out.println("<font color='green'><b>UserID Available</b></font>");
          
                
        }
        
       
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        
        
        if(op!=null && op.equals("add")){
//            String password =StringEscapeUtils.escapeHtml(request.getParameter("password"));
//            String pwdhash = java.util.Base64.getEncoder().encodeToString(password.getBytes());
            System.out.println("pwd");
            String imgPath = ImageUtility.uploadImage(request, getServletConfig(), "media");
             System.out.println("img");
            if(imgPath!=null){
                System.out.println("1");
                HttpSession session = request.getSession();
                BloggerDao bd = new BloggerDao();
                Blogger blogger = (Blogger)session.getAttribute("blogger");
                blogger.setPic(imgPath);
//                blogger.setPassword(pwdhash);
                
                String catIds[] = (String[]) session.getAttribute("categories");
                session.removeAttribute("blogger");
                session.removeAttribute("categories");
                
                if(bd.add(blogger, catIds))
                    response.sendRedirect("blogin.jsp");
                else
                    out.println("<font color='red'>Not Registered</font>");
            }
        }
        
         if(op!=null && op.equals("login")){
            String userid=request.getParameter("userid");
            String password=request.getParameter("password");
            BloggerDao bd = new BloggerDao();
            Blogger blogger = bd.getByLoginDetails(userid, password);
            
            if(blogger!=null){
                if(blogger.getStatus().equalsIgnoreCase("approved")){
                    HttpSession session = request.getSession();
                    session.setAttribute("blogger",blogger);
                    
                    String remember = request.getParameter("remember");
                    if(remember!=null){
                    Cookie c = new Cookie("bloggerUserid", userid);
                    Cookie c1 = new Cookie("bloggerPassword", password);
                    
                    c.setMaxAge(60*60*24*7);
                    c1.setMaxAge(60*60*24*7);
                    
                    response.addCookie(c);
                    response.addCookie(c1);
                    }
                    response.sendRedirect("blogger/dashboard.jsp");
                }
                    else
                    response.sendRedirect("blogin.jsp?errorMessage=Account is pending for Approval");
            }
            else{
                response.sendRedirect("blogin.jsp?errorMessage=Invalid UserId or Password");
            }
            
        }
           
        if(op!=null && op.equalsIgnoreCase("changeStatus")){
            int id= Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            
            if(new BloggerDao().changeStatus(id, status))
                response.sendRedirect(request.getHeader("referer"));
            else
                out.println("Status cannot be changed.....");
        }
       
    }

  
 

}
