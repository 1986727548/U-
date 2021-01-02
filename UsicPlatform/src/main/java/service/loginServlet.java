package service;

import bean.User;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao dao = UserDao.getInstance();
        User user = dao.login(username, password);
        if(user != null){
            System.out.println((username + "," + password + "->" + "登录成功"));
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            writer.print("yes");
        }else{
            System.out.println((username + "," + password + "->" + "登录失败"));
            writer.print("no");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
