package com.controller;

import com.sun.xml.ws.developer.servlet.HttpSessionScope;
import com.util.ImageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.beans.User;
import com.daos.UserDao;
import com.db.DataConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HP
 */
public class UserController extends HttpServlet {

   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        
        if(op!=null && op.equals("delete")){    
        int id = Integer.parseInt(request.getParameter("id"));
            UserDao ud = new UserDao();
            if(ud.delete(id))
                response.sendRedirect("ShowUsers.jsp");
            else
                out.println("Record not deleted....");
                
            }
        
         if(op!=null && op.equals("checkuserid"))
        { 
            String userid = request.getParameter("userid");
            UserDao ud = new UserDao();
           
            
        }
       }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        
        if(op!=null && op.equals("add")){
            String imgPath = ImageUtility.uploadImage(request, getServletConfig(), "media");
            if(imgPath!=""){
                HttpSession session =request.getSession();
                User user = (User)session.getAttribute("user");
                user.setPic(imgPath);
                
                UserDao ud = new UserDao();
                if(ud.add(user))
                    response.sendRedirect("ShowUsers.jsp");
                else
                    out.println("Record is no inserted...");
            }
        }

        if(op!=null && op.equals("update")){
            User user = (User)request.getAttribute("user1");
            UserDao ud = new UserDao();
            if(ud.update(user))
                response.sendRedirect("ShowUsers.jsp");
            else
                out.println("Record is not updated.....");
            
        }
       
    }
}


    

