/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2020-12-01 16:34:41 UTC
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
import java.util.*;

public final class main_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("java.util");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <title>main_page</title>\r\n");
      out.write("  <script src=\"http://code.jquery.com/jquery-latest.js\"></script>\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/main_page.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");

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
    
      out.write("\r\n");
      out.write("  <header>\r\n");
      out.write("    <div class=\"logo\">\r\n");
      out.write("      <a href=\"main_page.jsp\">\r\n");
      out.write("      <img id=\"logo\" src=\"../img/logo.png\">\r\n");
      out.write("      </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <nav class=\"main-nav\">\r\n");
      out.write("      <a href=\"#Recommend\">Recommend</a>\r\n");
      out.write("      ");

      for(int i=0;i<genre.size();i++){
          out.println("<a href=#"+genre.get(i)+">"+genre.get(i)+"</a>");
      }
      
      out.write("\r\n");
      out.write("      <a href=\"#Mylist\" class=\"mylist\">Mylist</a>\r\n");
      out.write("    </nav>\r\n");
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
      out.write("    <div class=\"search-section\">\r\n");
      out.write("        <form class=\"search-form\" method=\"POST\" action=\"movieDB.jsp\">\r\n");
      out.write("            <div class=\"label-container\">\r\n");
      out.write("                <h2 id=\"search-text\">검색</h2>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"box-container\">\r\n");
      out.write("                <input class=\"input-field\" type=\"text\" name=\"name\" placeholder=\"이름\" required>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"box-container\" id=\"search-button-container\">\r\n");
      out.write("                <input id=\"search-button\" type=\"submit\" value=\"검색\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"table-title\">\r\n");
      out.write("        <h1 id=\"Recommend\">Recommend</h1>\r\n");
      out.write("    </div>\r\n");
      out.write("    <table class=\"table-fill\">\r\n");
      out.write("    <thead>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th class=\"text-left\">영화 제목</th>\r\n");
      out.write("            <th class=\"text-center\">영화 타입</th>\r\n");
      out.write("            <th class=\"text-center\">성인물 여부</th>\r\n");
      out.write("            <th class=\"text-center\">상영 시간</th>\r\n");
      out.write("            <th class=\"text-center\">평점</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("    </thead>\r\n");
      out.write("    <tbody class=\"table-hover\">\r\n");
      out.write("    </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    ");

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
    
      out.write("\r\n");
      out.write("    <div class=\"mylist\">\r\n");
      out.write("        <div class=\"table-title\">\r\n");
      out.write("            <h1 id=\"Mylist\">Mylist</h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <table class=\"table-fill\">\r\n");
      out.write("        <thead>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th class=\"text-left\">영화 제목</th>\r\n");
      out.write("                <th class=\"text-center\">영화 타입</th>\r\n");
      out.write("                <th class=\"text-center\">성인물 여부</th>\r\n");
      out.write("                <th class=\"text-center\">상영 시간</th>\r\n");
      out.write("                <th class=\"text-center\">평점</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </thead>\r\n");
      out.write("        <tbody class=\"table-hover\">\r\n");
      out.write("        ");

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
        
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("        </table>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"footer\">\r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("  $(document).ready(function(){\r\n");
      out.write("    var admin = localStorage.getItem(\"admin\");\r\n");
      out.write("    if(admin == null){\r\n");
      out.write("      location.href='../index.html';\r\n");
      out.write("    }\r\n");
      out.write("    if(admin == 'customer'){\r\n");
      out.write("      $(\".manager-menu\").css(\"display\",\"none\");\r\n");
      out.write("    }\r\n");
      out.write("    if(");
      out.print(count);
      out.write(" == 0){\r\n");
      out.write("        $(\".mylist\").css(\"display\",\"none\");\r\n");
      out.write("    }\r\n");
      out.write("  });\r\n");
      out.write("</script>\r\n");
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
