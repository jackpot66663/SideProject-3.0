package controller;

import dao.AccountDAO;
import pojo.bean.UserInfo;
import service.RegisterService;
import util.ErrorMessageUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import util.FileProperties;

@WebServlet(value = "/Login",name = "controller.HomeController")
public class HomeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("auth")) {
            Authenication(request, response);
        } else if (action.equals("insert")) {
            HttpSession session = request.getSession();
            session.setAttribute("newUsername", request.getParameter("username"));
            session.setAttribute("newPassword", request.getParameter("password"));
            InsertNewAccount(request, response);
        } else if(action.equals("logout")){
            LogOut(request,response);
        }else{
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private void Authenication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO account = new AccountDAO();
        HttpSession session = request.getSession();
        String target = "";
        String userAccount = request.getParameter("username");
        String userPassword = request.getParameter("password");
        boolean isVerification = false;
        int errorcode = 0;
        String errorMsg = "";

        Boolean isAccountExist = account.checkAccountByUsername(userAccount);

        if (isAccountExist) {
            String password = account.getPasswordByUsername(userAccount);
            if (password.equals(userPassword)) {
                isVerification = true;
                UserInfo user = new UserInfo();
                user.setUsername(userAccount);
                user.setPassword(userPassword);
                session.setAttribute("userInfo",user);

                target = "jsp/index.jsp";
                response.sendRedirect(target);
            } else {
                errorcode = 1;
                errorMsg = ErrorMessageUtil.Error.Password_Account_FAIL.getErrorMsg();
                request.setAttribute("errorCode", errorcode);
                request.setAttribute("errorMsg", errorMsg);
                request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            }
        } else {
            errorcode = 2;
            errorMsg = ErrorMessageUtil.Error.No_Exist_Account_FAIL.getErrorMsg();
            request.setAttribute("errorCode", errorcode);
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
        }
    }


    private void InsertNewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO account = new AccountDAO();
        HttpSession session = request.getSession();

        String newUsername = (String) session.getAttribute("newUsername");
        String newPassword = (String) session.getAttribute("newPassword");
        boolean isAccountAlreadyExist = account.checkAccountByUsername((String) session.getAttribute("newUsername"));
        int errorcode = 0;
        String info = "";

        if (!isAccountAlreadyExist) {
            RegisterService registerService = new RegisterService();
            registerService.createNewAccount(newUsername, newPassword);
            info = "帳號創建成功，請登入";
        } else {
            errorcode = 3;
            info = ErrorMessageUtil.Error.Exist_Account_FAIL.getErrorMsg();
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append(info);
    }

    private void LogOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        if(session!=null){
            String sessionId = request.getSession().getId();
            session.invalidate();
        }

        Cookie[] cookies = request.getCookies();
        String domain = FileProperties.getInstance().getProperty("cookie.domain");
        if(cookies!=null){
            for(Cookie cookie:cookies){
                if(cookie.getName().equals("remember")){
                    cookie.setDomain(domain);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        response.sendRedirect("/");
    }

}
