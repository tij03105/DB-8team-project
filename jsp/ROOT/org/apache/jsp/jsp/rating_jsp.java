/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2020-11-26 15:10:21 UTC
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

public final class rating_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  <title>rating_page</title>\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/rating.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("  <header>\r\n");
      out.write("    <div class=\"logo\">\r\n");
      out.write("      <a href=\"../main_page.html\">\r\n");
      out.write("      <img id=\"logo\" src=\"../img/logo.png\">\r\n");
      out.write("    </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <nav class=\"main-nav\">\r\n");
      out.write("      <a href=\"#recommend\">Recommend</a>\r\n");
      out.write("      <a href=\"#action\">Action</a>\r\n");
      out.write("      <a href=\"#comedy\">Comedy</a>\r\n");
      out.write("      <a href=\"#romance\">Horror</a>\r\n");
      out.write("      <a href=\"#drama\">Drama</a>\r\n");
      out.write("      <a href=\"#mylist\">Mylist</a>\r\n");
      out.write("    </nav>\r\n");
      out.write("    <nav class=\"sub-nav\">\r\n");
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
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <h1 class=\"rating\">내가 평가한 영상물들</h1>\r\n");
      out.write("    \r\n");
      out.write("            ");

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
        }
      out.write("\r\n");
      out.write("        <table class=\"ratingList\">\r\n");
      out.write("        <tbody>\r\n");
      out.write("            <tr class=\"headResult\">\r\n");
      out.write("                <th class=\"title\">영화 제목</th>\r\n");
      out.write("                <th class=\"avRating\">평균 평점</th>\r\n");
      out.write("                <th class=\"myRating\">내가 내린 평점</th>\r\n");
      out.write("            </tr>");

        for(i=0;i<count_rating;i++){
      out.write("\r\n");
      out.write("            <tr class=\"findResult\">\r\n");
      out.write("                <td class=\"title\">");
      out.print(title[i]);
      out.write("</th>\r\n");
      out.write("                <td class=\"avRating\">");
      out.print(av_rating[i]);
      out.write("</th>\r\n");
      out.write("                <td class=\"myRating\">");
      out.print(rating[i]);
      out.write("</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");
}
      }
      else {
            
      out.write("<h3>조회된 결과가 없습니다</h3>");

        return;
		}
	}catch(SQLException ex) {
		System.err.println("sql error = " + ex.getMessage());
		System.exit(1);
	}
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("\r\n");
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
