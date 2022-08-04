<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/9/11
  Time: 下午 01:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check</title>
    <link rel="stylesheet" type="text/css" href="../css/forgetpassword.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="forget-page">
    <div class="form">
        <h2 style="color: firebrick">Oops!</h2>
        <form class="forget-form" method="post" style="margin-top: 15px">
            <input type="text" id="username" name="username" placeholder="username" required/>
            <input type="text" id="email" name="email" placeholder="email" required/>
            <button class="btn btn-primary" id="forget">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
<script>
    $(document).ready(function (){
        $('#forget').click(function (){
           var username = document.getElementById('username').value;
           var email = document.getElementById('email').value;
           $.ajax({
                url:"http://localhost:8082/EmailController",
                type:"POST",
                data: {"username":username,"email":email},
                success:function (data) {
                    alert("Email已送出，請至信箱收取密碼");
                }
           });
        });
    });
</script>
