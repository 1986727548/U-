package service;

import bean.MusicType;
import bean.User;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getPlaylistFromUserServlet")
public class getPlaylistFromUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
        Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
        MusicDao dao = MusicDao.getInstance();
        List<MusicType> list = dao.getPlaylistFromUser(uid);
        int allCount = 0;
        for(MusicType type : list){
            response.getWriter().print(type.getTname() +"<");
            allCount++;
        }
        response.getWriter().print(allCount);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
