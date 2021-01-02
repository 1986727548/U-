package service;

import bean.Comment;
import bean.Music;
import bean.MusicType;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.MusicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/displayCommentServlet")
public class displayCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
        MusicDao dao = MusicDao.getInstance();
        String tname = request.getParameter("tname");
//        System.out.println("displayCommentServlet in");
        List<MusicType> list = dao.getCidFromPlaylistComment(tname);

        Map<Integer, Comment> datas = new HashMap<Integer, Comment>();
        for(MusicType type : list){
            Comment ct = dao.getCommentBaseCid(type.getCid());
            datas.put(type.getCid(), ct);
        }
//        System.out.println("displayCommentServlet out");
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),datas);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
