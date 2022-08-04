<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/9/28
  Time: 下午 07:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>movie</title>
    <link rel="stylesheet" type="text/css" href="../css/movie.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/js/bootstrap-select.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="search_section">
    <div id="type_filter" class="movie_filter">
        <h1 style="font-size: 20px;font-family: 'Noto Sans TC', sans-serif;">電影種類:</h1>
        <select id="movieType" class="custom-select">
            <option value="" disabled selected>請選擇</option>
            <option name="category" value="1">科幻</option>
            <option name="category" value="2">動作</option>
            <option name="category" value="3">愛情</option>
        </select>
    </div>
    <div id="month_filter" class="movie_filter">
        <h1 style="font-size: 20px;font-family: 'Noto Sans TC', sans-serif;">上映日期(月):</h1>
        <select id="time" class="custom-select">
            <option value="" disabled selected>請選擇</option>
            <option name="month" value="1">8</option>
            <option name="month" value="2">9</option>
            <option name="month" value="3">10</option>
        </select>
    </div>
</div>
<div name="movie_button" style="text-align: center;margin-top: 50px">
    <button class="btn btn-primary" id="search" type="search">Search</button>
</div>
<div name="search_result" style="margin-top: 20px;display: none">
</div>

</body>
</html>

<script>
    var search_condition = new Object();

    $(document).ready(function () {
        var selectType;
        $('#type_filter').change(function () {
            selectType = $(this).find('option').filter(':selected').text();
            search_condition["movie_type"] = selectType;
        });
        var selectTime;
        $('#time').change(function () {
           selectTime = $(this).find('option').filter(':selected').text();
           search_condition["movie_time"] = selectTime;
        });

        $('#search').click(function () {
            $('div[name=search_result]').empty();

            var isValid = validCheck();

            if(isValid) {
                var promise = $.ajax({
                    url: "http://localhost:8083/search/movie",
                    type: "POST",
                    data: JSON.stringify(search_condition),
                    dataType: "JSON",
                    contentType: "application/json;charset=utf-8",
                });
                promise.done(function (value) {
                    $.ajax({
                        url: "http://localhost:8082/MovieController?status=display",
                        type: "POST",
                        data: {"result": JSON.stringify(value)},
                        success: function (html) {
                            swal("查詢完成");
                            $('div[name=search_result]').append(html);
                            $('div[name=search_result]').show();
                        }
                    })
                })
                promise.fail(function (jqxhr) {
                    console.log(jqxhr);
                })
            }else{
                swal("請至少選擇一個搜尋條件");
            }


        });


        //測試ajax打出去自動套dto
        /*var character = {
            "occupation" : "wizard",
            "skill" : "fireball"
        }
        $('#test').click(function () {
            $.ajax({
                url: "http://localhost:8083/search/test",
                type: "POST",
                data: JSON.stringify(character),
                dataType: "JSON",
                contentType: "application/json;charset=utf-8",
                success:function (value) {
                    console.log(value);
                }
            });
        })*/

    });

    function validCheck() {
        if(validMovieType()==false&&validMovieTime()==false){
            return false;
        }
        return true;
    }

    function validMovieType(){
        var checkMovieType = $('#movieType').find(':selected').text();
        if(checkMovieType == "請選擇"){
            return false;
        }
        return true;
    }
    function validMovieTime(){
        var checkMovieTime = $('#time').find(':selected').text();
        if(checkMovieTime == "請選擇"){
            return false;
        }
        return true;
    }
</script>
