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

        float rating = Float.parseFloat(request.getParameter("rating"));
        String tconst = request.getParameter("tconst");
        String maxconst = "";
        String sql = "";
        String id = (String)session.getAttribute("id");
        try {
            sql = "SELECT r_id FROM RATING WHERE tcon = '" + tconst + "'";
            rs = stmt.executeQuery(sql);
            if(!rs.isBeforeFirst()) {
                sql = "select max(R_ID) from RATING";

                rs = stmt.executeQuery(sql);
                rs.next();
                maxconst = rs.getString(1);
                maxconst = maxconst.replace("r", "");
                int temp = Integer.parseInt(maxconst);
                temp++;
                maxconst = String.format("%08d", temp);
                maxconst = "r" + maxconst;

                sql = "insert into RATING values('" + tconst + "', '" + maxconst + "', 0 )";
                rs = stmt.executeQuery(sql);
            else{
                rs.next();
                maxconst = rs.getString(1);
            }
            sql = "insert into PROVIDES values( " + rating + " ,  '" + maxconst + "', '" + id + "')"; 
            rs = stmt.executeQuery(sql);
            sql = "select AVG(Rating) FROM PROVIDES WHERE R_ID = '" + maxconst + "'";
            rs = stmt.executeQuery(sql);
            rs.next();
            Double mean = rs.getDouble(1);
            mean = Math.round(mean*10.0)/10.0;
            sql = "update RATING SET Average_Rating = " + mean + " WHERE  Tcon = '" + tconst  + "'";
            rs = stmt.executeQuery(sql);
        }catch (SQLException e) {
            e.printStackTrace();
            System.exit(1);
        }  
        out.println("<script>");
        out.println("alert('회원 등급변경이 완료되었습니다.')");
        out.println("location.href='../jsp/main_page.jsp'");
        out.println("</script>");
    %>
    </body>
</html>