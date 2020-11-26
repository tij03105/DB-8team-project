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
        
        request.setCharacterEncoding("UTF-8");

        String id = (String)session.getAttribute("id");

        /* 삭제를 위한 SQL문 */
        String sql = "DELETE ACCOUNT WHERE id = '" + id + "'";
        
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        out.println("<script>");
        out.println("alert('탈퇴 되었습니다.')");
        out.println("location.href='../index.html'");
        out.println("</script>");
    %>
    </body>
</html>