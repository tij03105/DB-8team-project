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

        String id = request.getParameter("id");
        String password = request.getParameter("pass");
        String checkPass = request.getParameter("checkPass");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String addr = request.getParameter("address");
        String job = request.getParameter("job");
        String sex = request.getParameter("sex");
        String date = request.getParameter("date");
        String membership = "Basic";
        final int act_limit = 3, rat_limit = 10;

        /* ID중복성 체크 */
        String sql = "SELECT id FROM ACCOUNT WHERE id = '" + id + "'";
        rs = stmt.executeQuery(sql);
        if(rs.next()) {
            out.println("<script>");
            out.println("alert('id가 이미 존재합니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }
        
        if(id.length() > 15){
            out.println("<script>");
            out.println("alert('id는 15자리 이하입니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

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

        if(name.length() > 20){
            out.println("<script>");
            out.println("alert('이름은 20자리 이하입니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

        if(!phone.matches("[0-9]+") || phone.length() != 11){
            out.println("<script>");
            out.println("alert('잘못된 전화번호입니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

        if(!(date.equals("") || date.matches("[0-9]*") && date.length() == 8)){
            out.println("<script>");
            out.println("alert('생년월일이 잘못되었습니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }
        
        if(addr.length()>30){
            out.println("<script>");
            out.println("alert('주소는 30자리이하입니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

        if(job.length()>15){
            out.println("<script>");
            out.println("alert('직업은 15자리이하입니다.')");
            out.println("location.href='../sign_up.html'");
            out.println("</script>");
            return;
        }

        /* 삽입을 위한 SQL문 */
        sql = "INSERT INTO ACCOUNT VALUES ('" + id + "', '" + password + "', '" + phone + "', '" + name + "',";
        if(addr.equals("")) sql += "NULL, ";
        else sql += "'" + addr + "', ";

        if(sex.equals("성별선택")) sql += "NULL, ";
        else if(sex.equals("남자")) sql += "'M', ";
        else sql += "'F', ";

        if(date.equals("")) sql += "NULL, ";
        else sql += "TO_DATE('" + date.substring(0,4) + "-" + date.substring(4,6) + "-" + date.substring(6) + "', 'yyyy-mm-dd'), ";

        if(job.equals("")) sql += "NULL, ";
        else sql += "'" + job + "', ";
        sql += "'" + membership + "', " + act_limit + ", " + rat_limit + ")";

        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        out.println("<script>");
        out.println("alert('가입이 완료되었습니다.')");
        out.println("location.href='../index.html'");
        out.println("</script>");
    %>
    </body>
</html>
