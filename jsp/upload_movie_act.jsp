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

        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String adult = request.getParameter("adult");
        String date = request.getParameter("date");
        String runtime = request.getParameter("runtime");
        String genre = request.getParameter("genre");

        String sql = "select max(tconst) from movie";
		rs = stmt.executeQuery(sql);
		rs.next();
		String maxconst = rs.getString(1);
		maxconst = maxconst.replace("t", "");
		int temp = Integer.parseInt(maxconst);
		temp++;
		maxconst = String.format("%08d", temp);
		maxconst = "t" + maxconst;

        if(title.length() > 30){
            out.println("<script>");
            out.println("alert('제목은 30자리 이하입니다.')");
            out.println("location.href='upload_movie.jsp'");
            out.println("</script>");
            return;
        }

        if(type.length() > 20){
            out.println("<script>");
            out.println("alert('타입은 20자리 이하입니다.')");
            out.println("location.href='upload_movie.jsp'");
            out.println("</script>");
            return;
        }
        
        if(!(date.equals("") || date.matches("[0-9]*") && date.length() == 8)){
            out.println("<script>");
            out.println("alert('잘못된 형식의 방송년도/개봉일입니다(YYYYMMDD)')");
            out.println("location.href='upload_movie.jsp'");
            out.println("</script>");
            return;
        }
        
        /* 영상물 추가를 위한 SQL문 */
		sql = "INSERT INTO MOVIE VALUES('" + maxconst + "',";

        sql += "'" + title + "', "; // title은 필수 입력
        if (!type.equals("")) sql += "'" + type + "', ";
        else sql += "'',";
        if (adult.equals("YES")) sql += "'A', ";
        else if(adult.equals("NO")) sql += "'R', ";
        else sql += "'',";
        if (!date.equals(""))
            sql += "TO_DATE('" + date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6) + "', 'yyyy-mm-dd'), ";
        else sql += "'',";
        if (!runtime.equals("")) sql += runtime + ", ";
        else sql += "'',";
        sql += "'" + genre + "')"; // genre는 필수 입력

        if(!sql.equals("")) {
            stmt.executeQuery(sql);
            out.println("<script>");
            out.println("alert('영상물 등록이 완료되었습니다.')");
            out.println("location.href='main_page.jsp'");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('영상물 등록 실패')");
            out.println("location.href='upload_movie.jsp'");
            out.println("</script>");
        }
    %>
    </body>
</html>