<%@ page import="util.ErrorMessageUtil" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/7/4
  Time: 下午 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<div class="bgpic">
<div class="login-page">
    <h2 style="font-family: 'Oswald', sans-serif;text-align: center">Welcome</h2>
    <div class="form">
        <form class="login-form" action="Login?action=auth" method="post">
            <input type="text" name="username" placeholder="username" required/>
            <input type="password" name="password" placeholder="password" required/>
            <button class="btn btn-primary">Login</button>
        </form>
        <p>Not registered?</p>
        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Sign Up</button>
        <a href="jsp/forgetpassword.jsp"><p style="margin-top: 10px">Forget Password</p></a>
    </div>

    <%--Model--%>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="form">
            <h1>Create Account</h1>
            <form class="create-form" method="post">
                <label>User Name:</label>
                <input type="text" name="newusername" placeholder="username" id="newusername" required>
                <label>Password:</label>
                <input type="password" name="newpassword" placeholder="password" id="newpassword" required/>
                <label>Confirm your password:<span id="message"></span></label>
                <input type="password" name="confirmpassword" placeholder="confirm password" id="confirm_password" required/>
                <button class="btn btn-primary" disabled="disabled" id="submit">Submit</button>
            </form>
        </div>
    </div>
</div>
</div>
</body>
<script>

    $(document).ready(function (){
        //登入後錯誤訊息
        if("${errorMsg}" != ""){
            alert("${errorMsg}");

        }

        //新增帳號Submit
        $('#submit').click(function () {
            var username = document.getElementById('newusername').value;
            var password = document.getElementById('newpassword').value;
            $.ajax({
                url:"http://localhost:8082/Login?action=insert",
                type:"POST",
                data: {"username":username,"password":password},
                async:false,
                success:function (errorMsg) {
                    alert(errorMsg);
                }
            });
        });


    });

    //確認密碼防呆
    $('#newpassword, #confirm_password').on('keyup', function () {
        if($.trim($('#newpassword').val())!='') {
            if ($('#newpassword').val() == $('#confirm_password').val()) {
                $('#message').html('Confirmed').css('color', 'green');
                $('#submit').attr('disabled',false);
            } else {
                $('#message').html('Failed').css('color', 'red');
                $('#submit').attr('disabled',true);
            }
        }else{
            $('#message').html('Empty Password').css('color', 'red');
            $('#submit').attr('disabled',true);
        }
    });

</script>
</html>
