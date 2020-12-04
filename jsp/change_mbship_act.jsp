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

        String tconst = request.getParameter("tconst");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String adult = request.getParameter("adult");
        String date = request.getParameter("date");
        String runtime = request.getParameter("runtime");
        String genre = request.getParameter("genre");

        String sql= "SELECT * FROM MOVIE WHERE tconst = '" + tconst + "'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(!rs.isBeforeFirst()){
            out.println("<script>");
            out.println("alert('존재하지않는 영상입니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }

        if(title.length() > 30){
            out.println("<script>");
            out.println("alert('제목은 30자리 이하입니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }

        if(type.length() > 20){
            out.println("<script>");
            out.println("alert('타입은 20자리 이하입니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }
        
        if(!(date.equals("") || date.matches("[0-9]*") && date.length() == 8)){
            out.println("<script>");
            out.println("alert('방송년도가 잘못되었습니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }
        
        /* 변경을 위한 SQL문 */
        sql = "UPDATE MOVIE SET ";
        String setSql = "";

        if (!title.equals("")) setSql += "title = '" + title + "', ";
        if (!type.equals("")) setSql += "title_type = '" + type + "', ";
        if (adult.equals("YES")) setSql += "is_adult = 'A', ";
        else if(adult.equals("NO")) setSql += "is_adult = 'R', ";

        if (!date.equals(""))
            setSql += "start_year = TO_DATE('" + date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6) + "', 'yyyy-mm-dd'), ";
        if (!runtime.equals("")) setSql += "runtime_minutes = " + runtime + ", ";
        if (!genre.equals("")) setSql += "gcode = '" + genre + "', ";

        if(!setSql.equals("")) {
            setSql = setSql.substring(0, setSql.length() - 2);
            sql += setSql + " WHERE tconst = '" + tconst + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            out.println("<script>");
            out.println("alert('변경이 완료되었습니다.')");
            out.println("location.href='../jsp/main_page.jsp'");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('변경할 정보가 없습니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
        }
    %>
    </body>
</html>