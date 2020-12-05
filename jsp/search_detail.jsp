<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page language="java" import="java.text.*, java.sql.*, java.util.ArrayList, java.util.InputMismatchException" %>
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
	String sqlv ="";
	//앞에서 입력한 값을 가져오기 위해서 먼저 선언을 해줍니다.
	String title;
	String[] version;
	String movie_type;
	String[] genre;
	String min_c, max_c;
	
	
	StringBuffer sb = new StringBuffer();
	int Ccnt; //추가된 조건 갯수
	int Vcnt; // version 선택유무
	int min = 0;
	int max = 0;
%>

<%

	Class.forName(driver);
	//DB에 접속을 한다.
	conn = DriverManager.getConnection(url,id,pw);

//전 화면으로부터 form문을 통해서 name을 받아오는 소스가 있습니다.
	title = request.getParameter("name");
	version = request.getParameterValues("version");
	movie_type = request.getParameter("movie_type");
	genre = request.getParameterValues("genre");
	
	try {
		min_c = request.getParameter("min");
		min = Integer.parseInt(min_c);
		max_c = request.getParameter("max");
		max = Integer.parseInt(max_c);
	}catch(NumberFormatException e){
		System.out.println("NumberFormatException");
	}
	
	Ccnt = 0;
	Vcnt = 0;
	
	String id = (String)session.getAttribute("id");
	
	sql = "SELECT DISTINCT tconst, title FROM MOVIE, GENRE, VERSION WHERE "
           + "tconst NOT IN (SELECT tcon FROM RATING R, PROVIDES P WHERE A_ID = '" + id + "' AND P.R_ID = R.R_ID)";
	sqlv = "SELECT DISTINCT VERSION.tcon, VERSION.original_title FROM MOVIE, GENRE, VERSION WHERE "
            + "tconst NOT IN (SELECT tcon FROM RATING R, PROVIDES P WHERE A_ID = '" + id + "' AND P.R_ID = R.R_ID)";
	
	
	if(title==null||title.trim().equals("")){
		%>
			<script type="text/javascript">
				alert("조건으로 검색합니다.");
			</script>
		<%
		
		//System.out.println("선택된 버전 개수 : " + version.length);
		//System.out.println("선택된 장르 개수 : " + genre.length);
		int i;
		
		System.out.println("version.length : " + version.length);
		//버전이 상관없음인 경우(1개 선택, 값이 null or "" ), 그렇지 않은경우(중복선택가능)
		if ( version.length == 1 && version[0].equals("") ){ //상관없음 선택한 경우
			sb.append(sql);
		}else{ //버전을 선택한 경우 version.length만큼 각각 where문에서 조건을 반복 추가해야한다.
			sb.append(sqlv);
		
		
			for(i = 0; i < version.length ; i++ ){
				if(i == 0){//첫번째 부분
					if( version[i].equals("")){
						i++;
						sb.append("AND (VERSION.nation = '" + version[i] + "'");
					}
					else{
						sb.append("AND (VERSION.nation = '" + version[i] + "'");
					}
				}else{
					sb.append("OR VERSION.nation = '" + version[i] + "'");
				}
				Ccnt++;
				Vcnt++;
			}
			sb.append(" AND VERSION.Tcon = MOVIE.Tconst )");
		}
		
		
		//선택된 무비 타입 sql에 추가.
		if ( movie_type.equals("movie") ){ //movie선택
			sb.append(" AND title_type = '" + movie_type + "'");
			Ccnt++;
		}
		if ( movie_type.equals("tv series") ){ //movie선택
			sb.append(" AND title_type = '" + movie_type + "'");
			Ccnt++;
		}
		if ( movie_type.equals("knuMovieDB Original") ){ //movie선택
			sb.append(" AND title_type = '" + movie_type + "'");
			Ccnt++;
		}
		

		String gCode = "";
		int gCnt = 0;
		int j;
		//상관없음인 경우, 그렇지 않은경우(중복선택가능)
		//장르 상관없음인 경우(1개 선택, 값이 null or "" ), 그렇지 않은경우(중복선택가능)
		if ( genre.length == 1 && genre[0].equals("") ){ //상관없음 선택한 경우
			
		}else{ //장르을 선택한 경우 gnre.length만큼 각각 where문에서 조건을 반복 추가해야한다.
			//action과 horror선택.
			
			for(j = 0; j < genre.length ; j++ ){ // 이부분도 sql에 account.ID조건이 없어서 AND를 안붙였지만 후에 AND 추가해야함.
				gCode = genre[j];
				if(j == 0){//첫번째 부분
					if( genre[j].equals("") ) gCode = genre[++j]; // 상관없음을 포함하여 조건입력시 무시하고 조건대로 입력받음
					sb.append(" AND (MOVIE.gCode = '" + gCode + "'");
				}else{
					sb.append(" OR MOVIE.gCode = '" + gCode + "'");
					gCnt++;
				}
			}
			if(gCnt>0) sb.append(" )");
		}
		
		
		//runtime 받는 부분.
		if ( min >= max ) {
			%>
			<script type="text/javascript">
				alert("runtime의 최소 시간을 최대시간보다 작게 설정하세요.");
				history.back();
			</script>
			<%
		}
		else{
			 sb.append(" AND ( MOVIE.Runtime_minutes >= " + min_c + " and MOVIE.Runtime_minutes <= " + max_c + ")");
		}

		if( Vcnt == 0){
			sb.append(" ORDER BY tconst");
		}
		else{
			sb.append(" ORDER BY tcon");
		}
		
        
		
	}else {
		sql = "select tconst, title from MOVIE where title LIKE '%" + title + "%'";
	}
	
	// 데이터 베이스 연결
	try {
		
		sql = sb.toString();
		sb.setLength(0);
		System.out.println(sql);
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		//해당 값의 개수를 가져옵니다.
		//rs에서 값을 가져올 때에는 타입에 맞게 getString, getInt 처럼 가져올 수 있다.

		
		
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
		sql ="";
	}catch (Exception c){
		System.out.println(c.getMessage());
	}finally{
		stmt.close();
		conn.close();
	}

%>

</body>
</html>

