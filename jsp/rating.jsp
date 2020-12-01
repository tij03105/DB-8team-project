<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>rating_page</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/rating.css" />
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
      <a href="../main_page.html">
      <img id="logo" src="../img/logo.png">
    </a>
    </div>
    <nav class="main-nav">
      <a href="#recommend">Recommend</a>
      <a href="#action">Action</a>
      <a href="#comedy">Comedy</a>
      <a href="#romance">Horror</a>
      <a href="#drama">Drama</a>
      <a href="#mylist">Mylist</a>
    </nav>
    <nav class="sub-nav">
      <li class="dropdown">
        <div class="manager-menu">Manage</div>
        <div class="menu-content">
          <a href="all_rating.jsp">모든평가내역 확인</a>
          <a href="">영상올리기</a>
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
    
    
    <h1 class="rating">내가 평가한 영상물들</h1>
    
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
    String[] title = null;
    double[] av_rating = null;
    double[] rating = null;
    int count_rating = 0; // rating 갯수
    int i=0;
    try {
      String sql = "select count(tconst) from movie m, rating r, provides p, account a" +
          " where m.tconst = r.tcon and r.r_id = p.r_id and p.a_id = a.id and	a.id = '"+ id + "'";
      rs = stmt.executeQuery(sql);
      rs.next();
      if((count_rating = rs.getInt(1)) != 0){
        title = new String[count_rating];
        av_rating = new double[count_rating];
        rating = new double[count_rating];
        sql = "select m.title, r.average_rating, p.rating from movie m, rating r, provides p, account a "
          +" where m.tconst = r.tcon and r.r_id = p.r_id and p.a_id = a.id and a.id = "
          + "'"+ id +"'";
        rs = stmt.executeQuery(sql);
        while(rs.next()) {
          title[i]= rs.getString(1);
          av_rating[i] = rs.getDouble(2);
          rating[i++] = rs.getDouble(3);
        }%>
        <table class="ratingList">
        <tbody>
            <tr class="headResult">
                <th class="title">영화 제목</th>
                <th class="avRating">평균 평점</th>
                <th class="myRating">내가 내린 평점</th>
            </tr><%
        for(i=0;i<count_rating;i++){%>
            <tr class="findResult">
                <td class="title"><%=title[i]%></th>
                <td class="avRating"><%=av_rating[i]%></th>
                <td class="myRating"><%=rating[i]%></th>
            </tr>
            <%}
      }
      else {
            %><h3>조회된 결과가 없습니다</h3><%
        return;
		}
	}catch(SQLException ex) {
		System.err.println("sql error = " + ex.getMessage());
		System.exit(1);
	}
    %>


        </tbody>
    </table>

  </div>
  <div class="footer">

  </div>
</body>
</html>