package service;

import bean.User;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/publishCommentServlet")
public class publishCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tname = request.getParameter("tname");
        String comment = request.getParameter("comment");
        String username = ((User)request.getSession().getAttribute("user")).getUsername();
        MusicDao dao = MusicDao.getInstance();
        Long showTime = System.currentTimeMillis();
        if(dao.addComment(username, comment, showTime)){
            Integer cid = dao.getCidFromComment(username, comment, showTime);
            if(dao.addCommentIntoPlaylist(tname, cid)){
                response.getWriter().write("yes");
            }else{
                response.getWriter().write("no");
            }
        }else{
            response.getWriter().write("no");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
