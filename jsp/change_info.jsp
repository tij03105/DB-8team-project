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
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String addr = request.getParameter("address");
        String job = request.getParameter("job");
        String sex = request.getParameter("sex");
        String date = request.getParameter("date");

        if(name.length() > 20){
            out.println("<script>");
            out.println("alert('이름은 20자리 이하입니다.')");
            out.println("location.href='../change_info.html'");
            out.println("</script>");
            return;
        }

        if(!phone.equals("") && (phone.matches("[0-9]+") && phone.length() != 11)){
            out.println("<script>");
            out.println("alert('잘못된 전화번호입니다.')");
            out.println("location.href='../change_info.html'");
            out.println("</script>");
            return;
        }

        if(!(date.equals("") || date.matches("[0-9]*") && date.length() == 8)){
            out.println("<script>");
            out.println("alert('생년월일이 잘못되었습니다.')");
            out.println("location.href='../change_info.html'");
            out.println("</script>");
            return;
        }
        
        if(addr.length()>30){
            out.println("<script>");
            out.println("alert('주소는 30자리이하입니다.')");
            out.println("location.href='../change_info.html'");
            out.println("</script>");
            return;
        }

        if(job.length()>15){
            out.println("<script>");
            out.println("alert('직업은 15자리이하입니다.')");
            out.println("location.href='../change_info.html'");
            out.println("</script>");
            return;
        }

        /* 변경을 위한 SQL문 */
        String sql = "UPDATE ACCOUNT SET ";
        String setSql = "";

        if(!phone.equals("")) setSql += "phone = '" + phone + "', ";
        if(!name.equals("")) setSql += "name = '" + name + "', ";
        if(!addr.equals("")) setSql += "address = '" + addr + "', ";
        if(sex.equals("남자")) setSql += "sex = 'M', ";
        else if(sex.equals("여자")) setSql += "sex = 'F', ";
        if(!date.equals("")) setSql += "bdate = TO_DATE('" + date.substring(0,4) + "-" + date.substring(4,6) + "-" + date.substring(6) + "', 'yyyy-mm-dd'), ";
        if(!job.equals("")) setSql += "job = '" + job + "', ";

        if(!setSql.equals("")) {
            setSql = setSql.substring(0, setSql.length()-2);
            sql += setSql + " WHERE id = '" + id + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            out.println("<script>");
            out.println("alert('변경이 완료되었습니다.')");
            out.println("location.href='../main_page.html'");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('변경할 정보가 없습니다.')");
            out.println("location.href='../change_info.html'");
            out.println("</script>");
        }
    %>
    </body>
</html>