<%@ page import="java.util.List" %>
<%@ page import="pojo.model.GameScoreboardEntity" %>
<%@ page import="dao.GameDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/7/30
  Time: 上午 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    GameDAO game = new GameDAO();
    List<GameScoreboardEntity> list = game.getallRecord();
    request.setAttribute("gameList",list);
%>
<html>
<head>
    <title>Score</title>
    <link rel="stylesheet" type="text/css" href="../css/scoreboard.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
</head>
<body>
    <div name="game_score">
        <table class="game_board">
            <thead>
                <tr>
                    <th style="text-align: center">#</th>
                    <th style="text-align: center">使用者名稱</th>
                    <th style="text-align: center">狀態</th>
                    <th style="text-align: center">更新時間</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${gameList}">
                    <tr>
                        <td><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.account}"/></td>
                        <td><c:out value="${user.status}"/></td>
                        <td><c:out value="${user.updatetime}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <%--<div name="game_button" style="text-align: center;margin-top: 25px">
        <button class="btn btn-primary" type="refresh" onclick="refreshPage()">Refresh</button>
    </div>--%>
</body>
</html>
