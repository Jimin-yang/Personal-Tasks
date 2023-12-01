<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        function moveToUserSpace() {
            window.location.href = "membership.jsp";
        }
        function moveToAdminLogin() {
            window.location.href = "login.jsp";
        }
    </script>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String email = request.getParameter("email");

    Statement stmt = null;

    try {
        String sql = "INSERT INTO Member(id,passwd,email) VALUES('" + id + "','" + passwd + "', '" + email + "')";
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);

        // 회원가입 성공 메시지 출력
        out.println("<h3>Home > 회원 등록 성공</h3><hr>");
        out.println("<p>축하합니다!<br>");
        out.println("<p>관리자인 경우만 로그인 수행이 가능합니다.");
        out.println("<p> <input type='button' value='◀사용자 공간 이동' onclick='moveToUserSpace()'> <input type='button' value='관리자 모드 이동▶' onclick='moveToAdminLogin()'>");
    } catch (SQLException ex) {
        out.println("Member 테이블 삽입이 실패했습니다.<br>");
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (stmt != null)
            stmt.close();
        if (conn != null)
            conn.close();
    }
%>
</body>
</html>
