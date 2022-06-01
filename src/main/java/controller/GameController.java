package controller;

import dao.GameDAO;
import pojo.bean.UserInfo;
import pojo.model.GameScoreboardEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controller.GameController")
public class GameController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        UserInfo user = (UserInfo) session.getAttribute("userInfo");
        String account = user.getUsername();
        boolean isFirst = GameDAO.checkRecordByUsername(account);
        if (isFirst) {
            InsertNewRecord(status,account);
        } else {
            UpdateRecord(status,account);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private static void InsertNewRecord(String status,String account) {
        GameDAO game = new GameDAO();
        game.insertNewRecord(account, status);
    }

    private static void UpdateRecord(String status,String account) {
        GameDAO game = new GameDAO();
        game.updateRecordByUsername(account,status);
    }
}
