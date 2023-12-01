<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    PreparedStatement pstmt = null;

    try {
        String sql = "delete from Member where id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        int count = pstmt.executeUpdate();
        
        if (count == 1) {
            // 회원 삭제 성공
            response.sendRedirect("drawSuccess.jsp");
        } else {
            // 회원 삭제 실패
            response.sendRedirect("drawErr.jsp");
        }

    } catch (SQLException ex) {
        out.println("SQL문에 오류가 있습니다.");
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>
</body>
</html>
