/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.59
 * Generated at: 2020-11-27 12:11:06 UTC
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

public final class change_005fmbship_005fact_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
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
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String adult = request.getParameter("adult");
        String date = request.getParameter("date");
        String runtime = request.getParameter("runtime");
        String genre = request.getParameter("genre");

        String sql= "SELECT * FROM MOVIE WHERE tconst = '" + tconst + "'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(!rs.isBeforeFirst()){
            out.println("<script>");
            out.println("alert('존재하지않는 영상입니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }

        if(title.length() > 30){
            out.println("<script>");
            out.println("alert('제목은 30자리 이하입니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }

        if(type.length() > 20){
            out.println("<script>");
            out.println("alert('타입은 20자리 이하입니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }
        
        if(!(date.equals("") || date.matches("[0-9]*") && date.length() == 8)){
            out.println("<script>");
            out.println("alert('방송년도가 잘못되었습니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
            return;
        }
        
        /* 변경을 위한 SQL문 */
        sql = "UPDATE MOVIE SET ";
        String setSql = "";

        if (!title.equals("")) setSql += "title = '" + title + "', ";
        if (!type.equals("")) setSql += "title_type = '" + type + "', ";
        if (adult.equals("YES")) setSql += "is_adult = 'A', ";
        else if(adult.equals("NO")) setSql += "is_adult = 'R', ";

        if (!date.equals(""))
            setSql += "start_year = TO_DATE('" + date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6) + "', 'yyyy-mm-dd'), ";
        if (!runtime.equals("")) setSql += "runtime_minutes = " + runtime + ", ";
        if (!genre.equals("")) setSql += "gcode = '" + genre + "', ";

        if(!setSql.equals("")) {
            setSql = setSql.substring(0, setSql.length() - 2);
            sql += setSql + " WHERE tconst = '" + tconst + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            out.println("<script>");
            out.println("alert('변경이 완료되었습니다.')");
            out.println("location.href='../main_page.html'");
            out.println("</script>");
        }
        else{
            out.println("<script>");
            out.println("alert('변경할 정보가 없습니다.')");
            out.println("location.href='change_movie.jsp'");
            out.println("</script>");
        }
    
      out.write("\r\n");
      out.write("    </body>\r\n");
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