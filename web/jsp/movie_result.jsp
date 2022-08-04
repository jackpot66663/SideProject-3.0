<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/10/10
  Time: 下午 04:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>movie_result</title>
    <link rel="stylesheet" type="text/css" href="../css/movie_result.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
</head>
<body>
    <div name="movie_result">
        <c:choose>
            <c:when test="${fn:length(resultList)>0}">
                <table class="movie_board">
                    <thead>
                    <tr>
                        <th style="text-align: center">電影名稱</th>
                        <th style="text-align: center">主演</th>
                        <th style="text-align: center">上映時間</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="movie" items="${resultList}">
                            <tr>
                                <td><c:out value="${movie.movie}"/></td>
                                <td><c:out value="${movie.starring}"/></td>
                                <td><c:out value="${movie.time}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h1 style="font-size:20px;font-family: 'Noto Sans TC', sans-serif;">查詢結果無相關資料</h1>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
