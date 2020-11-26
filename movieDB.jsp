<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
<%!
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Statement stst;
	String id = "movie", pw="movie";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";
	//앞에서 입력한 값을 가져오기 위해서 먼저 선언을 해줍니다.
	String title;
%>

<%
//전 화면으로부터 form문을 통해서 name을 받아오는 소스가 있습니다.
	title = request.getParameter("name");

	
	if(title==null||title.trim().equals("")){
		%>
			<script type="text/javascript">
				alert("조건으로 검색합니다.");
				sql = "select tconst, title from MOVIE where ";
				//history.back();
			</script>
		<%
		return;
	}else {
		sql = "select tconst, title from MOVIE where title LIKE '%" + title + "%'";
	}
	
	// 데이터 베이스 연결
	try {
		Class.forName(driver);
		//DB에 접속을 한다.
		conn = DriverManager.getConnection(url,id,pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		//해당 값의 개수를 가져옵니다.
		//rs에서 값을 가져올 때에는 타입에 맞게 getString, getInt 처럼 가져올 수 있다.

		System.out.println(sql);
		
		if(!rs.next()){
			System.out.println("검색 결과가 없습니다.");
		}
		out.println("<table>");
		
		int cnt = rsmd.getColumnCount();
		for(int i=1; i <= cnt; i++){
			out.println("<th>" + rsmd.getColumnClassName(i)+"</th>");
		}
		
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("</tr>");
		}
		
		out.println("</table>");
		rs.close();
		stmt.close();
		conn.close();
	}catch (Exception c){
		System.out.println(c.getMessage());
	}finally{
		stmt.close();
		conn.close();
	}

%>

</body>
</html>

