<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            session.invalidate();
        %>
        <script>
            localStorage.clear();
            alert('로그아웃 되었습니다.');
            location.href='../index.html';
        </script>
    </body>
</html>
