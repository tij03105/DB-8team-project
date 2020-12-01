<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <title>upload_movie</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/change_movie.css" />
    </head>
    <script>
  $(document).ready(function(){
    var admin = localStorage.getItem("admin");
    if(admin == null){
      location.href='../index.html';
    }
    if(admin == 'customer'){
      $(".manager-menu").css("display","none");
    }
  });
</script>
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
        
        String sql = "SELECT * FROM GENRE";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
    %>
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
        <div id="container">
            <form id="form" class="upload-movie-form" action="upload_movie_act.jsp" method="post">
                <div class="label-container">
                    <h2 id="change-movie-text">영상물 등록</h2>
                </div>
                <div class="box-container">
                    <input class="input-field" type="text" name="title" placeholder="제목(필수 입력)" required>
                </div>
                <div class="box-container">
                    <input class="input-field" type="text" name="type" placeholder="타입">
                </div>
                <div class="select-container">
                        <select id="select-adult" name="adult">
                            <option selected value="">성인물 여부</option>
                            <option>YES</option>
                            <option>NO</option>
                        </select>
                </div>
                <div class="box-container">
                    <input class="input-field" type="text" name="date" placeholder="방송년도/개봉일(YYYYMMDD)">
                </div>
                <div class="box-container">
                    <input class="input-field" type="text" name="runtime" placeholder="상영시간(분단위)">
                </div>
                <div class="select-container">
                        <select id="select-genre" name="genre" required>
                            <option selected value="">장르(필수 선택)</option>
                            <%
                                while(rs.next()){
                                    out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                }
                            %>
                        </select>
                </div>
                <div class="box-container" id="change-movie-button-container">
                    <input id="change-movie-button" type="submit" value="완료">
                </div>
            </form>
        </div>
    </div>
    </body>
</html>