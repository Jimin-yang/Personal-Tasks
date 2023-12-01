<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">
function checkMember() {
    // ID 유효성 검사
    var regExpId = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/;
    var regExpPasswd = /.{6,}/; // 6자 이상
    var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,4}$/i;

    var form = document.member;
    
    var id = form.id.value;
    var passwd = form.passwd.value;
    var email = form.email.value;

    if (!regExpId.test(id)) {
        alert("아이디는 한글, 영문 대소문자만 입력 가능합니다.");
        form.id.select();
        return;
    }
    // Password 길이 및 형식 검사
    if (!regExpPasswd.test(passwd)) {
        alert("비밀번호는 6자 이상 입력해야 합니다.");
        return;
    }

    // Email 형식 검사   
    if (!regExpEmail.test(email)) {
        alert("올바른 이메일 주소를 입력해주세요.");
        return;
    }

    form.submit();
}
</script>
<body>
    <h3>Home > 회원 가입</h3>
    <form action="signupSuccess.jsp" name="member" method="post">
        <fieldset style="width:300px">
            <legend>회원 가입 화면</legend>
            <p> 아이디 : <br> <input type="text" name="id">
            <p> 비밀번호 : <br> <input type="password" name="passwd">
            <p> 이메일 : <br> <textarea name="email" rows="1" cols="40"></textarea></p>
            <br>
            <p> <input type="reset" value="◀다시 작성">
                <input type="submit" value="가입하기▶" onclick="checkMember()">   
        </fieldset>      
    </form>
</body>
</html>
