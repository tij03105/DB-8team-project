/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2020-12-04 17:46:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.*;
import java.sql.*;

public final class movie_005fdetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.text");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <title>mavie_detail</title>\r\n");
      out.write("  <script src=\"http://code.jquery.com/jquery-latest.js\"></script>\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/movie_detail.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<script>\r\n");
      out.write("    $(document).ready(function(){\r\n");
      out.write("      var admin = localStorage.getItem(\"admin\");\r\n");
      out.write("      if(admin == null)\r\n");
      out.write("        location.href='../index.html';\r\n");
      out.write("      if(admin == 'customer'){\r\n");
      out.write("        $(\".manager-menu\").css(\"display\",\"none\");\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("<body>\r\n");
      out.write("  <header>\r\n");
      out.write("    <div class=\"logo\">\r\n");
      out.write("      <a href=\"main_page.jsp\">\r\n");
      out.write("      <img id=\"logo\" src=\"../img/logo.png\">\r\n");
      out.write("    </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <nav class=\"sub-nav\">\r\n");
      out.write("      <li class=\"dropdown\">\r\n");
      out.write("        <div class=\"manager-menu\">Manage</div>\r\n");
      out.write("        <div class=\"menu-content\">\r\n");
      out.write("          <a href=\"all_rating.jsp\">모든평가내역 확인</a>\r\n");
      out.write("          <a href=\"upload_movie.jsp\">영상올리기</a>\r\n");
      out.write("          <a href=\"change_movie.jsp\">영상수정</a>\r\n");
      out.write("          <a href=\"../change_mbship.html\">회원등급 변경</a>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("      <li class=\"dropdown\">\r\n");
      out.write("        <div class=\"account-menu\">Account</div>\r\n");
      out.write("        <div class=\"menu-content\">\r\n");
      out.write("          <a href=\"rating.jsp\">내가내린평가</a>\r\n");
      out.write("          <a href=\"../change_pw.html\">비밀번호변경</a>\r\n");
      out.write("          <a href=\"../change_info.html\">개인정보수정</a>\r\n");
      out.write("          <a href=\"../withdraw.html\">회원탈퇴</a>\r\n");
      out.write("          <a href=\"logout.jsp\">로그아웃</a>\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("    </nav>\r\n");
      out.write("  </header>\r\n");
      out.write("  <div class=\"main\">\r\n");
      out.write("    <h1 class=\"rating\">영상물 상세정보</h1>\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("        <table class=\"ratingList\">\r\n");
      out.write("            <tbody>\r\n");
      out.write("                <tr class=\"headResult\">\r\n");
      out.write("                    <th class=\"title\">제목</th>\r\n");
      out.write("                    <th class=\"type\">영상물 타입</th>\r\n");
      out.write("                    <th class=\"is_adult\">관람 등급</th>\r\n");
      out.write("                    <th class=\"start_year\">개봉년도</th>\r\n");
      out.write("                    <th class=\"running_time\">상영시간</th>\r\n");
      out.write("                    <th class=\"genre\">장르</th>\r\n");
      out.write("                    <th class=\"av_rating\">평균 평점</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr class=\"findResult\">\r\n");
      out.write("                    <td class=\"title\">");
      out.print(title);
      out.write("</th>\r\n");
      out.write("                    <th class=\"type\">");
      out.print(type);
      out.write("</th>\r\n");
      out.write("                    <th class=\"is_adult\">");
      out.print(is_adult);
      out.write("</th>\r\n");
      out.write("                    <th class=\"start_year\">");
      out.print(start_year);
      out.write("</th>\r\n");
      out.write("                    <th class=\"running_time\">");
      out.print(running_time);
      out.write("</th>\r\n");
      out.write("                    <th class=\"genre\">");
      out.print(genre);
      out.write("</th>\r\n");
      out.write("                    <th class=\"av_rating\">");
      out.print(av_rating);
      out.write("</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("        ");

        }catch(SQLException ex) {
            System.err.println("sql error = " + ex.getMessage());
            System.exit(1);
        }
        
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("\r\n");
      out.write("    <h1 class=\"actor_crew\">출연/제작</h1>\r\n");
      out.write("    <table class=\"actor\">\r\n");
      out.write("        <tbody>\r\n");
      out.write("            <tr class=\"headResult\">\r\n");
      out.write("                <th class=\"actor_name\">배우 이름</th>\r\n");
      out.write("                <th class=\"actor_primary_name\">주요작 배역</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        ");
 for(i=0;i<count_rating;i++) { 
      out.write("\r\n");
      out.write("            <tr class=\"findResult\">\r\n");
      out.write("                <td class=\"actor_name\">");
      out.print(actor_name[i]);
      out.write("</th>\r\n");
      out.write("                <td class=\"actor_primary_name\">");
      out.print(actor_primary_name[i]);
      out.write("</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        ");
 } 
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    <table class=\"crew\">\r\n");
      out.write("        <tbody>\r\n");
      out.write("            <tr class=\"headResult\">\r\n");
      out.write("                <th class=\"crew_type\">역할</th>\r\n");
      out.write("                <th class=\"crew_name\">이름</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        ");
 for(i=0;i<count_rating;i++) { 
      out.write("\r\n");
      out.write("            <tr class=\"findResult\">\r\n");
      out.write("                <td class=\"crew_type\">");
      out.print(crew_type[i]);
      out.write("</th>\r\n");
      out.write("                <td class=\"crew_name\">");
      out.print(crew_name[i]);
      out.write("</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        ");
 } 
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    \r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"footer\">\r\n");
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
