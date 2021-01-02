package bean;

import java.util.Date;

public class UserSessionInfo {
    private String username;
    private String sessionId;
    private Date loginDate;

    public UserSessionInfo(){}

    public UserSessionInfo(String username, String sessionId, Date loginDate) {
        this.username = username;
        this.sessionId = sessionId;
        this.loginDate = loginDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    @Override
    public String toString() {
        return "UserSessionInfo{" +
                "username='" + username + '\'' +
                ", sessionId='" + sessionId + '\'' +
                ", loginDate=" + loginDate +
                '}';
    }
}
