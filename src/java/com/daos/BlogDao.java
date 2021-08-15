/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import java.util.ArrayList;
import java.sql.*;
import com.db.DataConnection;  
import com.beans.Blog;
import com.beans.Blogger;

public class BlogDao {
    public int getBlogCountByCategory(int catid){
      int count=0;
        try {
            Connection con = DataConnection.getConnection();
            String sql = "select count(id) from blogs where status='approved' and id in(select blogid from blogcategory where categoryid = ?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, catid);
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            rs.close();
            smt.close();
            con.close();
            }
            
            
        } catch (Exception e) {
            System.out.println("Eroe in counting Blogs...." + e.getMessage());
        }
        return count;
    }
    
    public boolean add(Blog blog,String categories[]){
        boolean status=false;
        Connection con = DataConnection.getConnection();
        
        try {
            con.setAutoCommit(false);
            String sql = "insert into blogs (title,description,date,bloggerId,poster)values(?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, blog.getTitle());
            smt.setString(2, blog.getDescription());
            smt.setString(3, blog.getDate());
            smt.setInt(4, blog.getBloggerId());
            smt.setString(5, blog.getPoster());
           
            if(smt.executeUpdate()>0){
                String sql1="select id from blogs order by id desc limit 1";
                PreparedStatement smt1 = con.prepareStatement(sql1);
                ResultSet rs = smt1.executeQuery();
                int bloggerId = 0;
                
                if(rs.next()){
                    bloggerId = rs.getInt("id");
                    for(String cid : categories){
                        
                        String sql2 = "insert into blogCategory (blogId,categoryId) values (?,?)";
                        PreparedStatement smt2 = con.prepareStatement(sql2);
                        smt2.setInt(1,bloggerId);
                        smt2.setInt(2, Integer.parseInt(cid));
                        smt2.executeUpdate();
                    }
                }
            }
            con.commit();
            con.close();
            smt.close();
            status = true;
        } catch (Exception e) {
            System.out.println("Blog insertion error : " + e.getMessage());
            try {con.rollback();} catch (Exception ex) {}
            
            
        }
    return status;    
    }
    
     public boolean update(Blog blog,String categories[]){
        boolean status=false;
        Connection con = DataConnection.getConnection();
        
        try {
            con.setAutoCommit(false);
            String sql = "update blogs set title=?,description=?,date=?,bloggerId=?,poster=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, blog.getTitle());
            smt.setString(2, blog.getDescription());
            smt.setString(3, blog.getDate());
            smt.setInt(4, blog.getBloggerId());
            smt.setString(5, blog.getPoster());
            smt.setInt(6, blog.getId());
            System.out.println("123");
           
            if(smt.executeUpdate()>0){
                System.out.println("1");
               String sql1 = "delete from blogCategory where blogId=?";
               PreparedStatement smt1 = con.prepareStatement(sql1);
               smt1.setInt(1, blog.getId());
               if(smt1.executeUpdate()>0){
                 int blogId = blog.getId();
                 
             
                 for(String cid : categories){
                        
                        String sql2 = "insert into blogCategory (blogId,categoryId) values (?,?)";
                        PreparedStatement smt2 = con.prepareStatement(sql2);
                        smt2.setInt(1,blogId);
                        smt2.setInt(2, Integer.parseInt(cid));
                        smt2.executeUpdate();
                    }
                }
            }
            con.commit();
            con.close();
            smt.close();
            status = true;
        } catch (Exception e) {
            System.out.println("Blog updation error : " + e.getMessage());
            try {con.rollback();} catch (Exception ex) {}
            
            
        }
    return status;    
    }
    
    public ArrayList<Blog> getAllBlogs(){
        ArrayList<Blog> blist = new ArrayList();
        
        try {
            Connection con =DataConnection.getConnection();
            String sql = "select * from blogs";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            smt.close();
            rs.close();
            
        } catch (Exception e) {
            System.out.println("Error in fetching blogs details...." + e.getMessage());
        }
        
        return blist;
        
    }
      public ArrayList<Blog> getAllBlogsBloggerId(int bloggerId){
        ArrayList<Blog> blist = new ArrayList();
        
        try {
            Connection con =DataConnection.getConnection();
            String sql = "select * from blogs where bloggerId=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, bloggerId);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            smt.close();
            rs.close();
            
        } catch (Exception e) {
            System.out.println("Error in fetching blogs details...." + e.getMessage());
        }
        
        return blist;
        
    }
   
    public Blog getBlogDetailById(int bid){
       Blog blog = null;
        
        try {
            Connection con =DataConnection.getConnection();
            String sql = "select * from blogs where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, bid);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                
            }
            con.close();
            smt.close();
            rs.close();
            
        } catch (Exception e) {
            System.out.println("Error in fetching blogs by Id...." + e.getMessage());
        }
        
        return blog;
        
    }
    
    public ArrayList<Blog> getBlogsByCategory(int cid){
        ArrayList<Blog> blist = new ArrayList();
        
        try {
            Connection con =DataConnection.getConnection();
            String sql = "select * from blogs where id in(select blogId from blogCategory where categoryId=? )";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, cid);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            smt.close();
            rs.close();
            
        } catch (Exception e) {
            System.out.println("Error in fetching blogs details...." + e.getMessage());
        }
        
        return blist;
        
    }
    
    public ArrayList<Blog> getBlogsByCategory(int cid,String status){
        ArrayList<Blog> blist = new ArrayList();
        
        try {
            Connection con =DataConnection.getConnection();
            String sql = "select * from blogs where status=? and id in(select blogId from blogCategory where categoryId=? )";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            smt.setInt(2, cid);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            smt.close();
            rs.close();
            
        } catch (Exception e) {
            System.out.println("Error in fetching blogs details...." + e.getMessage());
        }
        
        return blist;
        
    }
    
    public boolean changeStatus (int id,String text){
        boolean status = false;
        
        try {
            Connection con = DataConnection.getConnection();
            String sql = "update blogs set status=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, text);
            smt.setInt(2, id);
            
            if(smt.executeUpdate()>0)
                status=true;
            
            con.close();
            smt.close();
           
        } catch (Exception e) {
            System.out.println("Error in update status...." + e.getMessage());
        }
        return status;
    }
     public ArrayList<Blog> getBlogsByStatus(String status){
        ArrayList blogList = new ArrayList();
        Blog blog = null;
        
        try {
            Connection con= DataConnection.getConnection();
            String sql = "select * from blogs where status=?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1, status);
           
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blogList.add(blog);
            }
            con.close();
            smt.close();
            rs.close();
            
        
        } catch (Exception e) {
            System.out.println("Error to fetching blogs by status   :" + e.getMessage());
        }
          return blogList;
        
    }
     
    
     public ArrayList<Blog> getRecentBlogsByStatus(String status,int start,int stop){
        ArrayList blogList = new ArrayList();
        Blog blog = null;
        
        try {
            Connection con= DataConnection.getConnection();
            String sql = "select * from blogs where status=? order by id desc limit ?,?";
            PreparedStatement smt=con.prepareStatement(sql);
            smt.setString(1, status);
            smt.setInt(2, start);
            smt.setInt(3, stop);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blogList.add(blog);
            }
            con.close();
            smt.close();
            rs.close();
            
        
        } catch (Exception e) {
            System.out.println("Error to fetching blogs by status   :" + e.getMessage());
        }
          return blogList;
        
    }
     
     public int getBlogCount(String status){
         int count=0;
         try {
             Connection con = DataConnection.getConnection();
             String sql = " select count(*) from blogs where status=?";
             PreparedStatement smt = con.prepareStatement(sql);
             smt.setString(1, status);
             ResultSet rs= smt.executeQuery();
             
             if(rs.next()){
                 count=rs.getInt(1);
             }
             con.close();
             smt.close();
             rs.close();
             
             
         } catch (Exception e) {
             System.out.println("error int counting blogges" + e.getMessage());
         }
         return count;
         
     }
}
