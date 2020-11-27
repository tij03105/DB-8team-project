<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            String serverIP = "localhost";
            String strSID = "orcl";
            String portNum = "1521";
            String user = "movie";
            String pass = "movie";
            String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
            Connection conn = null;
            PreparedStatement pstmt;
            Statement stmt;
            ResultSet rs;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url,user,pass);
            stmt = conn.createStatement();

            String tconst = request.getParameter("tconst");
            String sql= "SELECT * FROM MOVIE WHERE tconst = '" + tconst + "'";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int result = 1;
            if(!rs.isBeforeFirst()){
                result = 2;
            }
        %>
        <div id="res"></div>
        <input type="button" id="close" value="닫기">
        <script type="text/javascript">
        window.onload = function(){
            var result = <%=result%>;
            if(result == 1){
                document.getElementById("res").innerHTML = "영상물이 존재합니다.";
            }
            else{
                document.getElementById("res").innerHTML = "영상물이 존재하지 않습니다.";
            }
            
            document.getElementById("close").onclick = function(){
                close();
            }
        }	
        </script>
    </body>
</html>