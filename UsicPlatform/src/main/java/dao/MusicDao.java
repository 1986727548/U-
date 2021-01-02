package dao;

import bean.Comment;
import bean.Music;
import bean.MusicType;
import util.DBUtil;

import java.util.List;

public class MusicDao {
    private String addMusicSql = "insert into music(mname,playcount) values(?,?)";
    private String getMidFromMusicSql = "select mid from music where mname = ?";
    private String addMusicIntoTypeSql = "insert into music_type(tname, mid) values(?,?)";
    private String getMusicFromTypeSql = "select mname,playcount from music natural join music_type where tname=?";
    private String addOneCountIntoMusicSql = "update music set playcount = ? where mname = ?";
    private String getOneCountFromMusicSql = "select playcount from music where mname = ?";
    private String isExistPlaylistSql = "select lname as tname from playlist where uid = ? and lname = ?";
    private String createPlaylistSql = "insert into playlist(uid, lname) values(?,?)";
    private String getPlaylistFromUserSql = "select lname as tname from playlist where uid = ?";
    private String getPidFromPlaylistSql = "select pid  from playlist where uid = ? and lname = ?";
    private String collectMusicSql = "insert into playlist_music(pid, mid) values(?,?)";
    private String getPlaylistMusicFromUserSql = "select mname, playcount from music where mid in ( select mid from playlist_music where pid = ?);";

    private String addCommentSql = "insert into comment(username, comment, showTime) values(?, ?, ?)";
    private String getCidFromCommentSql = "select cid from comment where username = ? and comment = ? and showTime = ?";
    private String addCommentIntoPlaylistSql = "insert into playlist_comment(tname, cid) values(?,?)";
    private String getCidFromPlaylistCommentSql = "select cid from playlist_comment where tname = ?";
    private String getCommentBaseCidSql = "select username, comment, showTime from comment where cid = ?";

    private String deleteMusicSql = "delete from music where mid = ?";
    private String deleteMusicFromTypeSql = "delete from music_type where mid = ?";

    private static MusicDao dao = new MusicDao();

    private MusicDao(){}

    public static MusicDao getInstance(){ return dao; }

    public Comment getCommentBaseCid(Integer cid){
        return DBUtil.getList(Comment.class, getCommentBaseCidSql, cid).get(0);
    }

    public List<MusicType> getCidFromPlaylistComment(String tname){
        return DBUtil.getList(MusicType.class, getCidFromPlaylistCommentSql, tname);
    }

    public Boolean addCommentIntoPlaylist(String tname, Integer cid){
        return DBUtil.update(addCommentIntoPlaylistSql, tname, cid);
    }

    public Boolean addComment(String username, String comment, Long showTime){
        return DBUtil.update(addCommentSql, username, comment, showTime);
    }

    public Integer getCidFromComment(String username, String comment, Long showTime){
        return DBUtil.getList(MusicType.class, getCidFromCommentSql, username, comment, showTime).get(0).getCid();
    }

    public List<Music> getPlaylistMusicFromUser(Integer pid){
        return DBUtil.getList(Music.class, getPlaylistMusicFromUserSql, pid);
    }

    public Boolean collectMusic(Integer pid, Integer mid){
        return DBUtil.update(collectMusicSql, pid, mid);
    }

    public Integer getPidFromPlaylist(Integer uid, String lname){
        return DBUtil.getList(MusicType.class, getPidFromPlaylistSql, uid, lname).get(0).getPid();
    }

    public List<MusicType> getPlaylistFromUser(Integer uid){
        return DBUtil.getList(MusicType.class, getPlaylistFromUserSql, uid);
    }

    public Boolean createPlaylist(Integer uid, String lname){
        return DBUtil.update(createPlaylistSql, uid, lname);
    }

    public Boolean isExistPlaylist(Integer uid, String lname){
        return DBUtil.getList(MusicType.class, isExistPlaylistSql, uid, lname).size() != 0;
    }

    public Boolean deleteMusic(Integer mid){
        return DBUtil.update(deleteMusicSql, mid);
    }

    public Boolean deleteMusicFromType(Integer mid){
        return DBUtil.update(deleteMusicFromTypeSql, mid);
    }

    public Boolean addMusic(String mname, Integer playcount){
        return DBUtil.update(addMusicSql, mname, playcount);
    }

    public Integer getMidFromMusic(String mname){
        return DBUtil.getList(MusicType.class, getMidFromMusicSql, mname).get(0).getMid();
    }

    public Boolean addMusicIntoType(String tname, Integer mid){
        return DBUtil.update(addMusicIntoTypeSql, tname, mid);
    }

    public Integer getOneCountFromMusic(String mname){
        return  DBUtil.getList(Music.class, getOneCountFromMusicSql, mname).get(0).getPlaycount();
    }

    public Boolean addOneCountIntoMusic(Integer playcount, String mname){
        return DBUtil.update(addOneCountIntoMusicSql, playcount, mname);
    }

    public List<Music> getMusicFromType(String tname){
        return DBUtil.getList(Music.class, getMusicFromTypeSql, tname);
    }

}
