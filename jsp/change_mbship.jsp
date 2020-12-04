<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
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

        final String[] MEMBERSHIP = {"Basic", "Primium", "Prime"};
    	final int[] ACT_LIMIT = {3, 5, 7};
    	final int[] RAT_LIMIT = {10, 20, 30};

        String id = request.getParameter("id");
        String membership = request.getParameter("membership");
        
        String sql = "SELECT * FROM ACCOUNT WHERE id = '" + id + "'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(!rs.isBeforeFirst()){
            out.println("<script>");
            out.println("alert('존재하지않는 사용자입니다')");
            out.println("location.href='../change_mbship.html'");
            out.println("</script>");
            return;
        }

        int idx = -1;
        for(int i=0;i<MEMBERSHIP.length;i++){
            if(membership.equals(MEMBERSHIP[i]))
                idx = i;
        }

        if(idx>=0){
            sql = "UPDATE ACCOUNT SET membership = '" + MEMBERSHIP[idx] + "', act_limit = " + ACT_LIMIT[idx] + ", rat_limit = " + RAT_LIMIT[idx] + " WHERE id = '" + id + "'"; 
        } else{
            sql = "UPDATE ACCOUNT SET membership = NULL, act_limit = NULL, rat_limit = NULL WHERE id = '" + id + "'";
        }
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        out.println("<script>");
        out.println("alert('회원 등급변경이 완료되었습니다.')");
        out.println("location.href='../jsp/main_page.jsp'");
        out.println("</script>");
    %>
    </body>
</html>