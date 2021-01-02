package service;

import bean.Music;
import bean.User;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

@WebServlet("/getMusicTableServlet")
public class getMusicTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String type = request.getParameter("type");
        String keytype = request.getParameter("keytype");
        MusicDao dao = MusicDao.getInstance();
        List<Music> list;
        if(keytype.equals("public")){
             list = dao.getMusicFromType(type);
        }else{
            Integer uid = ((User)request.getSession().getAttribute("user")).getUid();
            Integer pid = dao.getPidFromPlaylist(uid, type);
            list = dao.getPlaylistMusicFromUser(pid);
        }

        Integer sum = 0;
        Collections.sort(list);
        for(int i = 0; i < list.size(); i++){
            sum += list.get(i).getPlaycount();
            writer.print(list.get(i).getMname()+"<");
        }
        writer.print(sum);
        writer.flush();
//        System.out.println("getMusicTableServlet over");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
