/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2020-12-01 14:44:54 UTC
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

public final class change_005fmovie_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <title>change_movie</title>\r\n");
      out.write("    <script src=\"http://code.jquery.com/jquery-latest.js\"></script>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/change_movie.css\" />\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
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
        
        String sql = "SELECT * FROM GENRE";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
    
      out.write("\r\n");
      out.write("    <header>\r\n");
      out.write("        <div class=\"logo\">\r\n");
      out.write("            <a href=\"main_page.jsp\">\r\n");
      out.write("            <img id=\"logo\" src=\"../img/logo.png\">\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <nav class=\"sub-nav\">\r\n");
      out.write("            <li class=\"dropdown\">\r\n");
      out.write("                <div class=\"manager-menu\">Manage</div>\r\n");
      out.write("                <div class=\"menu-content\">\r\n");
      out.write("                    <a href=\"all_rating.jsp\">모든평가내역 확인</a>\r\n");
      out.write("                    <a href=\"upload_movie.jsp\">영상올리기</a>\r\n");
      out.write("                    <a href=\"change_movie.jsp\">영상수정</a>\r\n");
      out.write("                    <a href=\"../change_mbship.html\">회원등급 변경</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"dropdown\">\r\n");
      out.write("                <div class=\"account-menu\">Account</div>\r\n");
      out.write("                <div class=\"menu-content\">\r\n");
      out.write("                    <a href=\"rating.jsp\">내가내린평가</a>\r\n");
      out.write("                    <a href=\"../change_pw.html\">비밀번호변경</a>\r\n");
      out.write("                    <a href=\"../change_info.html\">개인정보수정</a>\r\n");
      out.write("                    <a href=\"../withdraw.html\">회원탈퇴</a>\r\n");
      out.write("                    <a href=\"logout.jsp\">로그아웃</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </li>\r\n");
      out.write("        </nav>\r\n");
      out.write("    </header>\r\n");
      out.write("    <div class=\"main\">\r\n");
      out.write("        <div id=\"container\">\r\n");
      out.write("            <form id=\"form\" class=\"change-movie-form\" action=\"change_mbship_act.jsp\" method=\"post\">\r\n");
      out.write("                <div class=\"label-container\">\r\n");
      out.write("                    <h2 id=\"change-movie-text\">영상물 수정</h2>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"id-container\">\r\n");
      out.write("                    <div class=\"id-container-input\">\r\n");
      out.write("                        <input class=\"input-field-id\" type=\"text\" id=\"tconst\" name=\"tconst\" placeholder=\"*영상물 번호\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"id-container-button\"> \r\n");
      out.write("                        <button type=\"button\" id=\"search-button\">조회</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"box-container\">\r\n");
      out.write("                    <input class=\"input-field\" type=\"text\" name=\"title\" placeholder=\"제목\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"box-container\">\r\n");
      out.write("                    <input class=\"input-field\" type=\"text\" name=\"type\" placeholder=\"타입\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"select-container\">\r\n");
      out.write("                        <select id=\"select-adult\" name=\"adult\">\r\n");
      out.write("                            <option selected value=\"\">성인물 여부</option>\r\n");
      out.write("                            <option>YES</option>\r\n");
      out.write("                            <option>NO</option>\r\n");
      out.write("                        </select>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"box-container\">\r\n");
      out.write("                    <input class=\"input-field\" type=\"text\" name=\"date\" placeholder=\"방송년도(YYYYMMDD)\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"box-container\">\r\n");
      out.write("                    <input class=\"input-field\" type=\"text\" name=\"runtime\" placeholder=\"길이\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"select-container\">\r\n");
      out.write("                        <select id=\"select-genre\" name=\"genre\">\r\n");
      out.write("                            <option selected value=\"\">장르</option>\r\n");
      out.write("                            ");

                                while(rs.next()){
                                    out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                }
                            
      out.write("\r\n");
      out.write("                        </select>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"box-container\" id=\"change-movie-button-container\">\r\n");
      out.write("                    <input id=\"change-movie-button\" type=\"submit\" value=\"완료\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    </body>\r\n");
      out.write("    <script>\r\n");
      out.write("        $(document).ready(function(){\r\n");
      out.write("        var admin = localStorage.getItem(\"admin\");\r\n");
      out.write("        if(admin == null)\r\n");
      out.write("            location.href='../index.html';\r\n");
      out.write("        if(admin == 'customer'){\r\n");
      out.write("            $(\".manager-menu\").css(\"display\",\"none\");\r\n");
      out.write("        }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        window.onload=function(){\r\n");
      out.write("            document.getElementById(\"search-button\").onclick=function(){\r\n");
      out.write("                var tconst = document.getElementById(\"tconst\").value;\r\n");
      out.write("                if(tconst.trim() == '' || tconst == null){\r\n");
      out.write("                    alert('영상물 번호를 입력하세요.');\r\n");
      out.write("                }\r\n");
      out.write("                else{\r\n");
      out.write("                    window.open(\"about:blank\", \"winName\", \"width=400,height=300,top=100,left=200\");\r\n");
      out.write("                    var fr = document.getElementById(\"form\");\r\n");
      out.write("                    fr.action = \"movie_search.jsp\";\r\n");
      out.write("                    fr.target = \"winName\";\r\n");
      out.write("                    fr.submit();\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
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
