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
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
        <%!
            String str;
            Connection con;
            Statement stt;
            File file;
            int maxSize=50000;
            int maxFactSize=50000;
            String path="C:/Users/nagnath masali/Documents/NetBeansProjects/Project/web/image";
            String inpun="";
            String inppw="";
         %>
         
         <%
            
            String type=request.getContentType();
            //out.println(type);
            if(type.indexOf("multipart/form-data")>=0){
                //out.println("it is multipart");
                DiskFileItemFactory disFact=new DiskFileItemFactory();
                disFact.setSizeThreshold(maxFactSize);
                disFact.setRepository(new File("c:\\temp"));

                ServletFileUpload upload=new ServletFileUpload(disFact);
                upload.setSizeMax(maxSize);
                List lis=upload.parseRequest(request);
                Iterator itr=lis.iterator();
                while(itr.hasNext()){
                   
                    FileItem item=(FileItem)itr.next();
                    if(!item.isFormField()){
                        str=item.getName().toString();
                        //str=str+(str.substring(str.indexOf(".")));
                        //out.println(str);
                        file=new File(path,str);
                        item.write(file);
                        //out.print("Uploaded....");
                    }
                }
            }
         %>
         
         <%
            String url = "jdbc:mysql://localhost:3306/";
            String user = "root";
            String password = "";
            
            inpun=(String)session.getAttribute("un");
            inppw=(String)session.getAttribute("pw");
            
            session.setAttribute("un", inpun);
            session.setAttribute("pw", inppw);

            try
           {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(url, user, password);

            Statement stt = con.createStatement();
            
            //stt.execute("CREATE DATABASE IF NOT EXISTS proj");
            stt.execute("USE users");
            //out.println(str);
            //stt.execute("CREATE TABLE imgpath ("+"impath VARCHAR(50)"+")");
            
            stt.execute("INSERT INTO `imgpath`(`impath`, `description`) VALUES ('"+str+"','"+inpun+"')");
            
            //stt.execute("INSERT INTO `imgpath`(`impath`) VALUES ('"+str+"')");

            //stt.executeQuery("INSERT INTO `imgpath`(`impath`) VALUES"+" (["+str+")");
            //out.println("File path stored");
            
            }
            catch(Exception e){
                e.printStackTrace();
            }
            response.sendRedirect("../view/PhotoShow.jsp");
         %>
         
         
    </body>
</html>
