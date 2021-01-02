package dao;

import bean.User;
import util.DBUtil;

import java.util.List;

public class UserDao {
    private String loginSql = "select uid, username from user where username = ? and password = ?";
    private String isExistSql = "select username from user where username = ?";
    private String registerSql = "insert into user(username, password) values(?,?)";
    private String queryUidSql = "select uid from user where username = ?";

    private static UserDao dao = new UserDao();

    private UserDao(){ }

    public static UserDao getInstance(){
        return dao;
    }

    public Integer queryUid(String username){
        return DBUtil.getList(User.class, queryUidSql, username).get(0).getUid();
    }

    public User login(String username, String password){
        List<User> list = DBUtil.getList(User.class, loginSql, username, password);
        if(list.size() == 0)
            return null;
        return list.get(0);
    }

    public Boolean isExist(String username){
        return DBUtil.getList(User.class, isExistSql, username).size() != 0;
    }

    public Boolean register(String username, String password){
        return DBUtil.update(registerSql, username, password);
    }

    public static void main(String[] args){
//        List<User> list = DBUtil.getList(User.class, loginSql, "admin", "admin");
//        System.out.println(list.size());
    }
}
