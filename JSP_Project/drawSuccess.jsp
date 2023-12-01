<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 성공</title>
</head>
<body>
    <form action="withdraw.jsp" method="post">
        <h3>Home > 회원 탈퇴 성공</h3><hr>
        <p>그동안 감사했습니다.</p>
        <p> <input type="button" value="◀메인 화면으로" onclick="goToMain()">
            <input type="button" value="다시 가입하기▶" onclick="goToSignup()">
        </p>
    </form>

    <script>
        function goToMain() {
            window.location.href = "main.jsp";
        }

        function goToSignup() {
            window.location.href = "signup.jsp";
        }
    </script>
</body>
</html>
