<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>main_page</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/main_page.css" />
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

        ArrayList<String> genre = new ArrayList<>();
        ArrayList<String> gCode = new ArrayList<>();

        String sql = "SELECT * FROM GENRE";
        rs = stmt.executeQuery(sql);
        
        while(rs.next()){
            gCode.add(rs.getString(1));
            genre.add(rs.getString(2));
        }
    %>
  <header>
    <div class="logo">
      <a href="main_page.jsp">
      <img id="logo" src="../img/logo.png">
      </a>
    </div>
    <nav class="main-nav">
      <a href="#Recommend">Recommend</a>
      <%
      for(int i=0;i<genre.size();i++){
          out.println("<a href=#"+genre.get(i)+">"+genre.get(i)+"</a>");
      }
      %>
      <a href="#Mylist" class="mylist">Mylist</a>
    </nav>
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
    <div class="search-section">
        <form class="search-form" method="POST" action="movieDB.jsp">
            <div class="label-container">
                <h2 id="search-text">검색</h2>
            </div>
            <div class="box-container">
                <input class="input-field" type="text" name="name" placeholder="이름" required>
            </div>
            <div class="box-container" id="search-button-container">
                <input id="search-button" type="submit" value="검색">
            </div>
        </form>
    </div>
    <div class="table-title">
        <h1 id="Recommend">Recommend</h1>
    </div>
    <table class="table-fill">
    <thead>
        <tr>
            <th class="text-left">영화 제목</th>
            <th class="text-center">영화 타입</th>
            <th class="text-center">성인물 여부</th>
            <th class="text-center">상영 시간</th>
            <th class="text-center">평점</th>
        </tr>
    </thead>
    <tbody class="table-hover">
    </tbody>
    </table>
    <%
        for(int i=0;i<genre.size();i++){
          out.println("<div class=\"table-title\">");
          out.println("<h1 id="+genre.get(i)+">"+genre.get(i)+"</h1>");
          out.println("</div>");
          out.println("<table class=\"table-fill\">");
          out.println("<thead>");
          sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM RATING, MOVIE " +
            "WHERE Gcode = '" + gCode.get(i) + "' AND Tconst = Tcon ORDER BY Average_rating DESC) WHERE rownum BETWEEN 1 AND 5";
          
          out.println("<tr>");
          out.println("<th class=\"text-left\">영화 제목</th>");
          out.println("<th class=\"text-center\">영화 타입</th>");
          out.println("<th class=\"text-center\">성인물 여부</th>");
          out.println("<th class=\"text-center\">상영 시간</th>");
          out.println("<th class=\"text-center\">평점</th>");
          out.println("</tr>");
          out.println("</thead>");
          out.println("<tbody class=\"table-hover\">");
          rs = stmt.executeQuery(sql);
          while(rs.next()){
              out.println("<tr id=" + rs.getString(1) + ">");
              out.println("<td class=\"text-left\">" + rs.getString(2) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getString(3) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getString(4) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getInt(5) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getDouble(6) + "</th>");
              out.println("</tr>");
          }
          out.println("</tbody>");
          out.println("</table>");
        }
    %>
    <div class="mylist">
        <div class="table-title">
            <h1 id="Mylist">Mylist</h1>
        </div>
        <table class="table-fill">
        <thead>
            <tr>
                <th class="text-left">영화 제목</th>
                <th class="text-center">영화 타입</th>
                <th class="text-center">성인물 여부</th>
                <th class="text-center">상영 시간</th>
                <th class="text-center">평점</th>
            </tr>
        </thead>
        <tbody class="table-hover">
        <%
            String id = (String)session.getAttribute("id");
            sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM RATING R, MOVIE, PROVIDES P " +
             "WHERE A_Id = '" + id + "' AND R.R_ID = P.R_ID AND Tcon = Tconst) WHERE rownum BETWEEN 1 AND 5";

             int count = 0;
             rs = stmt.executeQuery(sql);
             while(rs.next()){
              out.println("<tr id=" + rs.getString(1) + ">");
              out.println("<td class=\"text-left\">" + rs.getString(2) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getString(3) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getString(4) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getInt(5) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getDouble(6) + "</th>");
              out.println("</tr>");
              count++;
            }
        %>
        </tbody>
        </table>
    </div>
  </div>
  <div class="footer">
  </div>
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
    if(<%=count%> == 0){
        $(".mylist").css("display","none");
    }
  });
</script>
</html>