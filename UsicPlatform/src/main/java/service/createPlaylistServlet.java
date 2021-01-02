package service;

import bean.User;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createPlaylistServlet")
public class createPlaylistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String playlist = request.getParameter("playlist");
        Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
        MusicDao dao = MusicDao.getInstance();
        if(dao.createPlaylist(uid, playlist)){
            response.getWriter().print("yes");
        }else{
            response.getWriter().print("no");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
