package listener;

import bean.User;
import bean.UserSessionInfo;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class UserSessionListener implements HttpSessionAttributeListener {

    public void attributeAdded(HttpSessionBindingEvent se) {
        HttpSession session = se.getSession();
        if(session.getAttribute("user") != null){
            String username = ((User)session.getAttribute("user")).getUsername();
            UserSessionInfo info = new UserSessionInfo(username, session.getId(), new Date(System.currentTimeMillis()));

            Map<String, UserSessionInfo> online = (Map<String, UserSessionInfo>) session.getServletContext().getAttribute("online");
            if(online == null){
                online = new HashMap<String, UserSessionInfo>();
            }
            online.put(session.getId(), info);
            session.getServletContext().setAttribute("online", online);

            Integer onlineCount = (Integer) session.getServletContext().getAttribute("onlineCount");
            if(onlineCount == null){
                onlineCount = 0;
            }
            onlineCount++;
            session.getServletContext().setAttribute("onlineCount", onlineCount);
            System.out.println(info + "->上线");
            System.out.println("在线人数->" + onlineCount);
        }
    }

    public void attributeRemoved(HttpSessionBindingEvent se) {
        HttpSession session = se.getSession();
        if("user".equals(se.getName())){
            Map<String, UserSessionInfo> online = (Map<String, UserSessionInfo>) session.getServletContext().getAttribute("online");
            UserSessionInfo info = online.remove(session.getId());
            session.getServletContext().setAttribute("online", online);
            Integer onlineCount = (Integer) session.getServletContext().getAttribute("onlineCount");
            onlineCount--;
            session.getServletContext().setAttribute("onlineCount", onlineCount);

            System.out.println(info + "->下线");
            System.out.println("在线人数->" + onlineCount);
        }
    }

}
