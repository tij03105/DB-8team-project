<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
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
	//�տ��� �Է��� ���� �������� ���ؼ� ���� ������ ���ݴϴ�.
	String title;
%>

<%
//�� ȭ�����κ��� form���� ���ؼ� name�� �޾ƿ��� �ҽ��� �ֽ��ϴ�.
	title = request.getParameter("name");

	
	if(title==null||title.trim().equals("")){
		%>
			<script type="text/javascript">
				alert("�������� �˻��մϴ�.");
				sql = "select tconst, title from MOVIE where ";
				//history.back();
			</script>
		<%
		return;
	}else {
		sql = "select tconst, title from MOVIE where title LIKE '%" + title + "%'";
	}
	
	// ������ ���̽� ����
	try {
		Class.forName(driver);
		//DB�� ������ �Ѵ�.
		conn = DriverManager.getConnection(url,id,pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		//�ش� ���� ������ �����ɴϴ�.
		//rs���� ���� ������ ������ Ÿ�Կ� �°� getString, getInt ó�� ������ �� �ִ�.

		System.out.println(sql);
		
		if(!rs.next()){
			System.out.println("�˻� ����� �����ϴ�.");
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

