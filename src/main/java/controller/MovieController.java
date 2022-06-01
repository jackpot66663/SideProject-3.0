package controller;

import pojo.bean.MovieResultBean;
import service.MovieSearchResultService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controller.MovieController")
public class MovieController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        if (status.equals("display")) {
            String json = request.getParameter("result");
            List<MovieResultBean> resultBeanList = new MovieSearchResultService().getMovieResultList(json);
            request.setAttribute("resultList",resultBeanList);
            request.getRequestDispatcher("jsp/movie_result.jsp").forward(request,response);
        } else {
            //todo
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
