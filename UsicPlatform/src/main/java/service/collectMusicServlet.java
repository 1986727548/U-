package service;

import bean.User;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/collectMusicServlet")
public class collectMusicServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
        String lname = request.getParameter("lname");
        String mname = request.getParameter("mname");
        MusicDao dao = MusicDao.getInstance();
        Integer mid = dao.getMidFromMusic(mname);
        Integer pid = dao.getPidFromPlaylist(uid, lname);

        if(dao.collectMusic(pid, mid)){
            response.getWriter().print("yes");
        }else{
            response.getWriter().print("no");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
