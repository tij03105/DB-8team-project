<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            session.invalidate();
            out.println("<script>");
            out.println("alert('로그아웃 되었습니다.')");
            out.println("location.href='../index.html'");
            out.println("</script>");
        %>
    </body>
</html>
