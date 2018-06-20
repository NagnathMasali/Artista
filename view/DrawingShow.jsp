<%-- 
    Document   : imageShow
    Created on : Nov 10, 2017, 12:36:37 AM
    Author     : nagnath masali
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paintings</title>
        <style>

            *{
                margin: 0;
                font-family:'gill shadow';  
                
            }
            .imgContainer{
                float:left;  
                margin:  2px;
                margin-left: 10px;
                margin-top:50px;
                font-family: 'gill shadow';
            } 
            #imgid{
                border: 2px solid;
                border-color: white;
            }
            html{
                background-image: url('../webimg/back_paint.jpg');   
                background-repeat: no-repeat;
                background-position: center center;
                -webkit-background-size: cover;
                background-size: cover;
            }
            .back{
                float: left;
                width: 50px;
                height: 10px;
                margin-top: 25px;
                margin-left: 50px;
            }
        </style>    
    </head>
    <body>
        <div id='bg'>
            
            <a class='back' href="../model/nextPage.jsp"><-Back</a>
                
            <form  style="width: 300px; margin: 10px auto 0 auto;" action="../controller/drawController.jsp" method="post" enctype="multipart/form-data">
                Upload your artwork
                <input type="file" name="picture">  

                <input type="submit" value="save">

            </form> 
            
            <%!
                Connection con;
                Statement stt;
                ResultSet res;
                String impath;
                String url = "jdbc:mysql://localhost:3306/";
                String user = "root";
                String password = "";
                String desc = "";
            %>

            <%
                String un =  (String)session.getAttribute("un");
                String pw  = (String)session.getAttribute("pw");
        
                session.setAttribute("un",un);
                session.setAttribute("pw",pw);
                try {
                    String query = "SELECT * FROM `drawpath` WHERE 1";

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stt = con.createStatement();

                    //stt.execute("CREATE DATABASE IF NOT EXISTS proj");
                    stt.execute("USE users");
                    res = stt.executeQuery(query);
                    while (res.next()) {
                        impath = res.getString(1);
                        desc = res.getString(2);
            %>

            <div class="imgContainer"> 
                <img id ='imgid' src="../image/<%=impath%>" height="240" width="240">       <!--expression tag for dynamic loading-->               
                <h2><%=desc%></h2>
                <h4><%=impath%></h4>
                
            </div>
           
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            
            %>
            
            
        </div>
            
    </body>
</html>
