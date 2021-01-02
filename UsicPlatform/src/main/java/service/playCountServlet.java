package service;

import bean.Music;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/playCountServlet")
public class playCountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mname = request.getParameter("mname");
        MusicDao dao = MusicDao.getInstance();
        Integer playcount = dao.getOneCountFromMusic(mname);
        if(dao.addOneCountIntoMusic(playcount+1, mname)){
            System.out.println("add one count success");
        }else{
            System.out.println("add one count failure");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
