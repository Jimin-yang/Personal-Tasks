<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용 공간</title>
<script type="text/javascript">
        function moveToUserOutSpace() {
            window.location.href = "withdraw.jsp";
        }
    </script>
</head>
<body>
<form action="main.jsp" method="post">
	<h3>Home > 회원 전용 공간</h3><hr>
	<p>반갑습니다.
	<p>여기는 회원 전용 공간입니다.
	<p>회원을 탈퇴하려면 버튼을 눌러주세요.
	<p> <input type="submit" value="◀메인 화면">
        <input type="button" value="회원 탈퇴하기▶" onclick='moveToUserOutSpace()'>  
        </form>
</body>
</html>