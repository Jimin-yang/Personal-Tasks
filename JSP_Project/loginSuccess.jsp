<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<script type="text/javascript">
        function moveToLogin() {
            window.location.href = "logout.jsp";
        }
    </script>
</head>
<body>
<h3>Home > 관리자 로그인</h3>
    <form action="memberlist.jsp" method="post">
            <p> 새로운 세션 생성 성공!
            <p> 관리자 [space]님이 입장하였습니다.
            <br>
            <p> <input type="submit" value="◀등록 회원 관리하기"> 
            	<input type="button" value="로그 아웃▶" onclick="moveToLogin()">        
    </form>
</body>
</html>