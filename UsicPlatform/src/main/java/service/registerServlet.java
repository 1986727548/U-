package service;

import dao.MusicDao;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao dao = UserDao.getInstance();
        MusicDao mdao = MusicDao.getInstance();

        if(dao.register(username, password)){
            System.out.println((username + "," + password + "->" + "注册成功"));
            Integer uid = dao.queryUid(username);
            mdao.createPlaylist(uid, "我喜欢的音乐");
            writer.print("yes");
        }else{
            System.out.println((username + "," + password + "->" + "注册失败"));
            writer.print("no");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
