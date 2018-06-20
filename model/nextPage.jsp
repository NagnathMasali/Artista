<!DOCTYPE html>
<html>
    <head>
        <title>WCE Artista</title>
        <style>
            *{
                margin: 0;

            }
            h1{
                color:white;
            }
            img{

            }
            #bg{
                background-image: linear-gradient(to bottom, rgba(255,255,255,0.25) 0%,rgba(255,255,255,0.25) 100%),url(../webimg/bg5.jpg);	
                background-size: cover;
                width:100%;
                height: 100vh;
            }
            .container{
                position: fixed;
                align-self: center;
                top: 15%;
                bottom:50%;
                padding-left: 12.5%;
                border: 1px;
            }
            .imgcontainer{
                float: left;
                padding: 40px;
                padding-right: 60px;
            }
            .op{
                opacity: 1.0;

            }
            .op .img::hover{
                opacity: 0.5;
            }
        </style>
    </head>


    <body>
        <%
        
        String un=(String)session.getAttribute("un");
        String pw=(String)session.getAttribute("pw");
        //out.println(un);
        session.setAttribute("un",un);
        session.setAttribute("pw",pw);
        %>
        <div id="bg">

           
            <div class="container">
                <div class="imgcontainer">

                    <a href="../view/PhotoShow.jsp"><img class="op" src="../webimg/d2.png" height="400" width="400"></a>
                    <p align="center"><font face="gill shadow"><h1 align="center">PHOTOS</h1></font></p>
                </div>
                <div class="imgcontainer">
                    <a href="../view/DrawingShow.jsp"><img class="op" src="../webimg/r1.png" height="400" width="400" ></a>
                    <p align="center" ><font face="gill shadow" opacity=0.5><h1 align="center">PAINTINGS</h1></font></p>
                </div>
                 <a style="width: 200px; margin-top: 25px; margin-left:455px; color: white; font-size: 150%;" href="../model/index.html">Logout</a>
            </div>
        </div>
    </body>
</html>