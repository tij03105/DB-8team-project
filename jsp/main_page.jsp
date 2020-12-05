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
        <form class="search-form" method="POST" action="search_detail.jsp">
            <div class="label-container">
                <h2 id="search-text">검색</h2>
            </div>
            <div class="box-container">
                <input class="input-field" type="text" name="name" placeholder="이름" required>
            </div>
            <div class="box-container" id="search-button-container">
                <input id="search-button" type="submit" value="검색">
                <button id="detail-search-button" type="button">상세검색 페이지로 이동</button>
            </div>
        </form>
    </div>
    <div class="recommend">
      <div class="table-title">
          <h1 id="Recommend">Recommend</h1>
          <h1 id="rec-text"><h1>
      </div>
      <table class="table-fill">
      <thead>
          <tr>
              <th class="text-left">영상 제목</th>
              <th class="text-center">영상 타입</th>
              <th class="text-center">성인물 여부</th>
              <th class="text-center">상영 시간</th>
              <th class="text-center">평점</th>
          </tr>
      </thead>
      <tbody class="table-hover">
        <%
            String id = (String)session.getAttribute("id");
            sql = "SELECT Sex, Bdate FROM ACCOUNT WHERE ID = '" + id + "'";
            rs = stmt.executeQuery(sql);
            rs.next();
            String sex = rs.getString(1);
            String bdate = rs.getString(2);
            int type = 0;
            /* 성별과 나이가 없는 아이디의 경우 */
            if(sex == null && bdate == null){
              sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM RATING, MOVIE WHERE Tconst = Tcon AND R_ID IN " + 
              "(SELECT R_ID FROM PROVIDES WHERE A_ID <> '" + id + "' GROUP BY R_ID HAVING COUNT(*) >= 5) ORDER BY Average_rating DESC) WHERE rownum BETWEEN 1 AND 5";
              type = 1;
            }
            /* 성별은 존재하고 나이가 없는 아이디의 경우 */
            else if(bdate == null){
              sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM MOVIE, RATING R WHERE Tconst = Tcon AND R.R_ID IN " +
              "(SELECT DISTINCT R_ID FROM ACCOUNT, PROVIDES P WHERE ID <> '" + id + "' AND Sex = '" + sex + "' AND ID = A_ID) ORDER BY Average_rating DESC) WHERE rownum BETWEEN 1 AND 5";
              type = 2;
            }
            /* 나이는 존재하고 성별은 없는 아이디의 경우 */
            else if(sex == null){
              Calendar cal = Calendar.getInstance();
              int year = cal.get(Calendar.YEAR);
              bdate = bdate.substring(0,4);
              int age = 2020 - Integer.parseInt(bdate) + 1;
              age = age/10*10; // 연령대를 구한다. ex) 20대
              int lowAge = age - 1, highAge = age + 8;
              sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM MOVIE, RATING R WHERE Tconst = Tcon AND R.R_ID IN " +
              "(SELECT DISTINCT R_ID FROM ACCOUNT, PROVIDES P WHERE ID <> '" + id + "' AND bdate BETWEEN TO_DATE('" + (year - highAge) + "-01-01', 'YYYY-MM-DD') AND TO_DATE('" + (year - lowAge) + "-12-31', 'YYYY-MM-DD') AND ID = A_ID) ORDER BY Average_rating DESC) WHERE rownum BETWEEN 1 AND 5";
              type = 3;
            }
            /* 나이와 성별이 모두 존재하는 아이디의 경우 */
            else {
              Calendar cal = Calendar.getInstance();
              int year = cal.get(Calendar.YEAR);
              bdate = bdate.substring(0,4);
              int age = 2020 - Integer.parseInt(bdate) + 1;
              age = age/10*10; // 연령대를 구한다. ex) 20대
              int lowAge = age - 1, highAge = age + 8;
              sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM MOVIE, RATING R WHERE Tconst = Tcon AND R.R_ID IN " +
              "(SELECT DISTINCT R_ID FROM ACCOUNT, PROVIDES P WHERE Sex = '" + sex + "' AND ID <> '" + id + "' AND bdate BETWEEN TO_DATE('" + (year - highAge) + "-01-01', 'YYYY-MM-DD') AND TO_DATE('" + (year - lowAge) + "-12-31', 'YYYY-MM-DD') AND ID = A_ID) ORDER BY Average_rating DESC) WHERE rownum BETWEEN 1 AND 5";
              type = 4;
            }
            int count = 0;
            rs = stmt.executeQuery(sql);
            while(rs.next()){
              out.println("<tr class=\"table\" id=\"" + rs.getString(1) + "\">");
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
    <%
        for(int i=0;i<genre.size();i++){
          out.println("<div class=\"table-title\">");
          out.println("<h1 id="+genre.get(i)+">"+genre.get(i)+"</h1>");
          out.println("</div>");
          out.println("<table class=\"table-fill\">");
          out.println("<thead>");
          sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM PROVIDES P, RATING R, MOVIE " +
            "WHERE Gcode = '" + gCode.get(i) + "' AND Tconst = Tcon AND P.A_ID <> '" + id + "' AND P.R_ID = R.R_ID ORDER BY Average_rating DESC) WHERE rownum BETWEEN 1 AND 5";
          
          out.println("<tr>");
          out.println("<th class=\"text-left\">영상 제목</th>");
          out.println("<th class=\"text-center\">영상 타입</th>");
          out.println("<th class=\"text-center\">성인물 여부</th>");
          out.println("<th class=\"text-center\">상영 시간</th>");
          out.println("<th class=\"text-center\">평점</th>");
          out.println("</tr>");
          out.println("</thead>");
          out.println("<tbody class=\"table-hover\">");
          rs = stmt.executeQuery(sql);
          while(rs.next()){
              out.println("<tr class=\"table\" id=\"" + rs.getString(1) + "\">");
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
                <th class="text-left">영상 제목</th>
                <th class="text-center">영상 타입</th>
                <th class="text-center">성인물 여부</th>
                <th class="text-center">상영 시간</th>
                <th class="text-center">평점</th>
            </tr>
        </thead>
        <tbody class="table-hover">
        <%
            sql = "SELECT * FROM (SELECT Tconst, Title, Title_type, Is_adult, Runtime_minutes, Average_rating FROM RATING R, MOVIE, PROVIDES P " +
             "WHERE A_Id = '" + id + "' AND R.R_ID = P.R_ID AND Tcon = Tconst) WHERE rownum BETWEEN 1 AND 5";

             int myCount = 0;
             rs = stmt.executeQuery(sql);
             while(rs.next()){
              out.println("<tr class=\"table\" id=\"" + rs.getString(1) + "\">");
              out.println("<td class=\"text-left\">" + rs.getString(2) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getString(3) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getString(4) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getInt(5) + "</th>");
              out.println("<td class=\"text-center\">" + rs.getDouble(6) + "</th>");
              out.println("</tr>");
              myCount++;
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
        $(".recommend").css("display","none");
    }
    if(<%=myCount%> == 0){
        $(".mylist").css("display","none");
    }

    var str = "";
    switch(<%=type%>){
      case 1:
      str = "평가가 많은 영화 TOP5";
      break;
      case 2:
      str = "같은 성별의 회원들이 평가한 영화 TOP5";
      break;
      case 3:
      str = "같은 나이대의 회원들이 평가한 영화 TOP5";
      break;
      case 4:
      str = "같은 성별, 나이대의 회원들이 평가한 영화 TOP5";
      break;
    }
    $("#rec-text").text(str);

    $(".table").click(function() {
      location.href="movie_detail.jsp?tconst="+$(this).attr('id');
    });

    $("#detail-search-button").click(function(){
      location.href="../search_cond.html";
    });
  });
</script>
</html>