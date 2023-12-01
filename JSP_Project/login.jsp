<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<body>
    <h3>Home > 로그인</h3>
    <form onsubmit="return checkLogin()" action="loginSuccess.jsp" method="post">
        <fieldset style="width:200px">
            <legend>로그인 화면</legend>
            <p> 아이디 : <br> <input type="text" name="id" id="id"> 
            <p> 비밀번호 : <br> <input type="password" name="passwd" id="passwd">            
            <p> <input type="submit" value="로그인▶▶"> 
        </fieldset>
        <script>
            function checkLogin() {
                var id = document.getElementById("id").value;
                var passwd = document.getElementById("passwd").value;

                // 유효성 검사
                if (id.trim() === '' || passwd.trim() === '') {
                    alert("아이디와 비밀번호를 모두 입력하세요.");
                    return false;
                }

                // 추가적인 유효성 검사
                if (id === 'space' && passwd === '123456') {
                    alert("로그인 성공!");
                    return true;
                } else {
                    alert("로그인 실패. 아이디와 비밀번호를 다시 확인하세요.");
                    window.location.href = 'loginErr.jsp'; // 로그인 실패 시 loginErr.jsp로 이동
                    return false;
                }
            }
        </script>
    </form>
</body>
</html>
