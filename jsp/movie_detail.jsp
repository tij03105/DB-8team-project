<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>mavie_detail</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/movie_detail.css" />
</head>
<script>
    $(document).ready(function(){
      var admin = localStorage.getItem("admin");
      if(admin == null)
        location.href='../index.html';
      if(admin == 'customer'){
        $(".manager-menu").css("display","none");
      }
    });
</script>
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
    <h1 class="rating">영상물 상세정보</h1>
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
        String title;
        String type;
        String is_adult;
        String start_year;
        int running_time;
        String genre;
        float av_rating;
        String[] actor_name;
        String[] actor_primary_name;
        String[] crew_type;
        String[] crew_name;
        int count_actor;
        int count_crew;
        int i;
        try {
            String sql = "select m.title, m.title_type, m.is_adult, m.start_year, m.runtime_minutes, g.genre, r.AVERAGE_RATING
                    from movie m, genre g, rating r where m.TCONST = '"+ tconst +"' and g.GENRE_CODE = m.GCODE and r.TCON = m.TCONST";
            rs = stmt.executeQuery(sql);
            rs.next()
            title = rs.getString(1);
            type = rs.getString(2);
            is_adult = rs.getString(3);
            start_year = rs.getString(4);
            running_time = rs.getInt(5);
            genre = rs.getString(6);
            av_rating = rs.getFloat(7);

            sql = "select a.name, a.primary_name from movie m, actor a, participates p "
                    + "where m.TCONST = 't00000001' and p.TCON = m.TCONST and p.NCON = a.NCONST";
            rs = stmt.executeQuery(sql);
            i = 0;
            while(rs.next()){
                actor_name[i] = rs.getString(1);
                actor_primary_name[i++] = rs.getString(2);
            }
            sql = "select c.crewtype, c.name from movie m, crew c, makes ma "
                    + "where m.TCONST = 't00000001' and c.CREWID = ma.C_ID and ma.MTCON = m.tconst";
            rs = stmt.executeQuery(sql);
            i = 0;
            while(rs.next()){
                crew_type[i] = rs.getString(1);
                crew_name[i++] = rs.getString(2);
            }
        %>
        <table class="ratingList">
            <tbody>
                <tr class="headResult">
                    <th class="title">제목</th>
                    <th class="type">영상물 타입</th>
                    <th class="is_adult">관람 등급</th>
                    <th class="start_year">개봉년도</th>
                    <th class="running_time">상영시간</th>
                    <th class="genre">장르</th>
                    <th class="av_rating">평균 평점</th>
                </tr>
                <tr class="findResult">
                    <td class="title"><%=title%></th>
                    <th class="type"><%=type%></th>
                    <th class="is_adult"><%=is_adult%></th>
                    <th class="start_year"><%=start_year%></th>
                    <th class="running_time"><%=running_time%></th>
                    <th class="genre"><%=genre%></th>
                    <th class="av_rating"><%=av_rating%></th>
                </tr>
        <%
        }catch(SQLException ex) {
            System.err.println("sql error = " + ex.getMessage());
            System.exit(1);
        }
        %>
        </tbody>
    </table>

    <h1 class="actor_crew">출연/제작</h1>
    <table class="actor">
        <tbody>
            <tr class="headResult">
                <th class="actor_name">배우 이름</th>
                <th class="actor_primary_name">주요작 배역</th>
            </tr>
        <% for(i=0;i<count_rating;i++) { %>
            <tr class="findResult">
                <td class="actor_name"><%=actor_name[i]%></th>
                <td class="actor_primary_name"><%=actor_primary_name[i]%></th>
            </tr>
        <% } %>
        </tbody>
    </table>
    <table class="crew">
        <tbody>
            <tr class="headResult">
                <th class="crew_type">역할</th>
                <th class="crew_name">이름</th>
            </tr>
        <% for(i=0;i<count_rating;i++) { %>
            <tr class="findResult">
                <td class="crew_type"><%=crew_type[i]%></th>
                <td class="crew_name"><%=crew_name[i]%></th>
            </tr>
        <% } %>
        </tbody>
    </table>
    
  </div>
  <div class="footer">

  </div>
</body>
</html>