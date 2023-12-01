<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Members List</title>
</head>
<body>
    <h3>Home > 등록 회원 관리</h3><hr>
    
    <%@ include file="dbconn.jsp" %>
    
    <%
        Statement stmt = null;
        ResultSet rs = null;
    
        try {
            String sql = "SELECT id, email, created_at FROM member";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            
            int count = 1;
            while (rs.next()) {
                String id = rs.getString("id");
                String email = rs.getString("email");
                Timestamp createdAt = rs.getTimestamp("created_at");
                
                out.println(count + " : " + id + " / " + email + " / " + createdAt + "<br>");
                count++;
            }
        } catch (SQLException ex) {
            out.println("SQL문에 오류가 있습니다.");
            out.println("SQLException: " + ex.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
    
    <hr>
    <form action="withdraw.jsp" method="post">
        <p> <input type="submit" value="◀회원 탈퇴시키기"> 
    </form>
    <form action="logout.jsp" method="post">
        <input type="submit" value="로그 아웃▶" > 
    </form>
    
</body>
</html>
