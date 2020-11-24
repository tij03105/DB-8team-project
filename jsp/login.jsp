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
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url,user,pass);
        
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("pass");
        
        String sql = "SELECT * FROM ACCOUNT WHERE id = '" + id + "' AND pw = '" + password + "'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(!rs.isBeforeFirst()){
            out.println("<script>");
            out.println("alert('계정을 다시 확인하세요')");
            out.println("location.href='../index.html'");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("location.href='../all_rating.html'");
            out.println("</script>");
        }
	%>
    </body>
</html>
