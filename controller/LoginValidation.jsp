<%-- 
    Document   : LoginValidation
    Created on : Nov 28, 2017, 1:51:57 PM
    Author     : nagnath masali
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%

        %>

        <%!
            Connection con;
            Statement stt;
            ResultSet res;
            String impath;
            String url = "jdbc:mysql://localhost:3306/";
            String user = "root";
            String password = "";
            String dbpwd = "";
            String un="";
            String pw="";
        %>

        <%            
            try {
                un = (String) request.getParameter("un");
                pw = (String) request.getParameter("pw");
                //out.println(un);
                session.setAttribute("un", un);
                session.setAttribute("pw", pw);
                String query = "select pw from login where '" + un + "' in (un)";

                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(url, user, password);
                Statement stt = con.createStatement();

                //stt.execute("CREATE DATABASE IF NOT EXISTS proj");
                stt.execute("USE users");
                res = stt.executeQuery(query);
                //out.println("------------NAGNATH-------------");
                while (res.next()) {
                    dbpwd = (res.getString(1)).toString();
                    //out.println(pw + " " + dbpwd);
                }
                //out.println("outside: " + pw + "   " + dbpwd);
                if (dbpwd.equals(pw)) {
                    //out.println("valid");
                    response.sendRedirect("../model/nextPage.jsp");
                } else {
                    //out.println("invalid login");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </body>
</html>
