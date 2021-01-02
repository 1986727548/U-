package util;

import java.lang.reflect.Method;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtil {
    private static String driver = ConfigManager.getInstance().getValue("driver");
    private static String url = ConfigManager.getInstance().getValue("url");
    private static String username = ConfigManager.getInstance().getValue("username");
    private static String password = ConfigManager.getInstance().getValue("password");

    private static Connection con = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    static {
        try {
            Class.forName(driver);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args){

    }

    public static Connection getConnection(){
        Connection connection = null;
        try {

            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static <T> List<T> getList(Class<T> c, String sql, Object...args){
        List<T> list = new ArrayList<T>();
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            for(int i = 0; i<args.length;i++) {
                ps.setObject(i + 1, args[i]);
//                System.out.println(args[i]);
            }
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int size = rsmd.getColumnCount();

            while(rs.next()) {
                Map<String,Object> map = new HashMap<String,Object>();
                for (int i = 1; i <= size; i++) {
                    String title = rsmd.getColumnLabel(i);
                    Object value = rs.getObject(title);
                    map.put(title, value);
                }

                T temp = c.getConstructor().newInstance();
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    String key = entry.getKey();
                    Object values = entry.getValue();
                    String methodName = "set" + key.substring(0, 1).toUpperCase() + key.substring(1);
                    Method method = c.getMethod(methodName, values.getClass());
                    method.invoke(temp,values);
                }
                list.add(temp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeJDBC();
        }
        return list;
    }

    public static boolean update(String sql, Object...args){
        boolean res = false;
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            for(int i = 0; i<args.length;i++) {
                ps.setObject(i + 1, args[i]);
            }
            res = ps.executeUpdate() != 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeJDBC();
        }
        return res;
    }

    public static void closeJDBC(){
        if(rs != null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(ps != null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(con != null){
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
