<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your JSP Project</title>
    <style>
        body {
            display: flex;
            flex-direction: column; /* 세로로 정렬 */
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #container {
            text-align: center;
        }

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        button {
            margin: 0 10px;

            display: inline-block;
        }
    </style>
</head>
<body>
    <div id="container">
        <img src="mainimg.png" alt="Your Image">
    </div>
    
    <div class="button-container">
        <form action="login.jsp" method="post">
            <button type="submit" id="adminBtn">관리자 접속하기</button>
        </form>

        <form action="signup.jsp" method="post">
            <button type="submit" id="userBtn">사용자 접속하기</button>
        </form>
    </div>
</body>
</html>