package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebFilter(
        urlPatterns = {"/*"}
)
public class notLoginFilter implements Filter {
    private static Set<String> set = new HashSet<String>();
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        if(((HttpServletRequest)req).getSession().getAttribute("user") == null){
            String url = ((HttpServletRequest) req).getRequestURL().toString();
//            System.out.println(url);
            Boolean flag = true;
            for(String s : set){
//                System.out.println(s);
                if(url.endsWith(s)){
                    ((HttpServletResponse)resp).sendRedirect("index.jsp");
                    flag = false;
                }
            }
            if(flag)
                chain.doFilter(req, resp);
        }else{
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        set.add("collectMusicServlet");
        set.add("createPlaylistServlet");
        set.add("getPlaylistFromUserServlet");
        set.add("isExistPlaylistServlet");
        set.add("logoutServlet");
        set.add("publishCommentServlet");
    }

}
