<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page language="java" import="java.text.*, java.sql.*, java.util.ArrayList, java.util.InputMismatchException" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>search_detail</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/search_detail.css" />
</head>
<body>
  <header>
    <div class="logo">
      <a href="main_page.jsp">
      <img id="logo" src="../img/logo.png">
    </a>
    </div>
    <nav class="sub-nav">
      <li class="dropdown">
        <div class="manager-menu">Manage</div>
        <div class="menu-content">
          <a href="all_rating.jsp">모든평가내역 확인</a>
          <a href="upload_movie.jsp">영상올리기</a>
          <a href="change_movie.jsp">영상수정</a>
          <a href="../change_mbship.html">회원등급 변경</a>
        </div>
      </li>
      <li class="dropdown">
        <div class="account-menu">Account</div>
        <div class="menu-content">
          <a href="rating.jsp">내가내린평가</a>
          <a href="../change_pw.html">비밀번호변경</a>
          <a href="../change_info.html">개인정보수정</a>
          <a href="../withdraw.html">회원탈퇴</a>
          <a href="logout.jsp">로그아웃</a>
        </div>
      </li>
    </nav>
  </header>
  <div class="main">
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Statement stst;
	String user = "movie";
	String pass = "movie";
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
	String min_c = "0", max_c = "10000";
	
	
	StringBuffer sb = new StringBuffer();
	int Ccnt; //추가된 조건 갯수
	int Vcnt; // version 선택유무
	int min = 0;
	int max = 0;
	Class.forName(driver);
	//DB에 접속을 한다.
	conn = DriverManager.getConnection(url,user,pass);

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
	boolean resultType = false;

	sql = "SELECT DISTINCT Tconst, Title, Title_type, Is_adult, Runtime_minutes FROM MOVIE, GENRE, VERSION WHERE "
           + "tconst NOT IN (SELECT tcon FROM RATING R, PROVIDES P WHERE A_ID = '" + id + "' AND P.R_ID = R.R_ID)";
	sqlv = "SELECT DISTINCT Tconst, Title, Title_type, Is_adult, Runtime_minutes, VERSION.tcon, VERSION.original_title FROM MOVIE, GENRE, VERSION WHERE "
            + "tconst NOT IN (SELECT tcon FROM RATING R, PROVIDES P WHERE A_ID = '" + id + "' AND P.R_ID = R.R_ID)";
	
	
	if(title==null||title.trim().equals("")){
		//System.out.println("선택된 버전 개수 : " + version.length);
		//System.out.println("선택된 장르 개수 : " + genre.length);
		int i;
		
		//System.out.println("version.length : " + version.length);
		
		
		
		if ( version == null ){ //상관없음 선택한 경우
			sb.append(sql);
		}else{ //버전을 선택한 경우 version.length만큼 각각 where문에서 조건을 반복 추가해야한다.
			resultType = true;
			sb.append(sqlv);
		
			for(i = 0; i < version.length ; i++ ){
				if(i == 0){//첫번째 부분
						sb.append("AND (VERSION.nation = '" + version[i] + "'");
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
		if ( movie_type.equals("tv_series") ){ //movie선택
			sb.append(" AND title_type = '" + movie_type + "'");
			Ccnt++;
		}
		if ( movie_type.equals("knuMovieDB_Original") ){ //movie선택
			sb.append(" AND title_type = '" + movie_type + "'");
			Ccnt++;
		}
		

		String gCode = "";
		int gCnt = 0;
		int j;
		//상관없음인 경우, 그렇지 않은경우(중복선택가능)
		//장르 상관없음인 경우(1개 선택, 값이 null or "" ), 그렇지 않은경우(중복선택가능)

		if ( genre == null ){
			
		}else{
			for(j = 0; j < genre.length ; j++ ){ 
				gCode = genre[j];
				if(j == 0){//첫번째 부분
					sb.append(" AND (MOVIE.gCode = '" + gCode + "'");
					gCnt++;
				}else{
					sb.append(" OR MOVIE.gCode = '" + gCode + "'");
					gCnt++;
				}
			}
			if(gCnt>0){
				sb.append(" )");	
			}
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
		sql = sb.toString();
		sb.setLength(0);
	}else {
		sql = "select Tconst, Title, Title_type, Is_adult, Runtime_minutes from MOVIE where title LIKE '%" + title + "%' AND " +
		" tconst NOT IN (SELECT tcon FROM RATING R, PROVIDES P WHERE A_ID = '" + id + "' AND P.R_ID = R.R_ID)";
	}
	
	%>
	<div class="table-title">
          <h1>검색결과</h1>
      </div>
      <table class="table-fill">
      <thead>
          <tr>
              <th class="text-left">영상 제목</th>
              <th class="text-center">영상 타입</th>
              <th class="text-center">성인물 여부</th>
              <th class="text-center">상영 시간</th>
			  <%
			  	if(resultType){
					  out.println("<th class=\"text-center\">원제</th>");
				  }
			  %>
          </tr>
	</thead>
	<%
	// 데이터 베이스 연결
	try {
		System.out.println(sql);
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		//해당 값의 개수를 가져옵니다.
		//rs에서 값을 가져올 때에는 타입에 맞게 getString, getInt 처럼 가져올 수 있다.

		if(!rs.isBeforeFirst()){
			out.println("검색 결과가 없습니다.");
		}
		
		while(rs.next()){
			out.println("<tr class=\"table\" id=\"" + rs.getString(1) + "\">");
			out.println("<td class=\"text-left\">" + rs.getString(2) + "</th>");
			out.println("<td class=\"text-center\">" + rs.getString(3) + "</th>");
			out.println("<td class=\"text-center\">" + rs.getString(4) + "</th>");
			out.println("<td class=\"text-center\">" + rs.getString(5) + "</th>");
			if(resultType){
				out.println("<td class=\"text-center\">" + rs.getString(7) + "</th>");
			}
			out.println("</tr>");
		}
		
		out.println("</table>");
		rs.close();
	}catch (Exception c){
		System.out.println(c.getMessage());
	}finally{
		stmt.close();
		conn.close();
	}

%>
</body>
<script>
  $(document).ready(function(){
    var admin = localStorage.getItem("admin");
    if(admin == null){
      location.href='../index.html';
    }
    if(admin == 'customer'){
      $(".manager-menu").css("display","none");
    }
    $(".table").click(function() {
      location.href="movie_detail.jsp?tconst="+$(this).attr('id');
    });
  });
</script>
</html>

