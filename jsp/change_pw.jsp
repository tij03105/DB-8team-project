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
        String password = request.getParameter("pass");
        String checkPass = request.getParameter("checkPass");

        if(!password.equals(checkPass)){
            out.println("<script>");
            out.println("alert('비밀번호가 다릅니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

        if(password.length() > 20){
            out.println("<script>");
            out.println("alert('비밀번호는 20자리 이하입니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

        /* 업데이트를 위한 SQL문 */
        String sql = "UPDATE ACCOUNT SET pw = '" + password + "' WHERE id = '" + id + "'";
        
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        out.println("<script>");
        out.println("alert('비밀번호 변경이 완료되었습니다.')");
        out.println("location.href='../main_page.html'");
        out.println("</script>");
    %>
    </body>
</html>