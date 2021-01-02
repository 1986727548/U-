package bean;

public class Comment {
    private String username;
    private String comment;
    private Long showTime;

    public Comment(){}

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Long getShowTime() {
        return showTime;
    }

    public void setShowTime(Long showTime) {
        this.showTime = showTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "username=" + username +
                ", comment='" + comment + '\'' +
                ", showTime=" + showTime +
                '}';
    }
}
