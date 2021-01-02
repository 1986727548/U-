package bean;

import org.jetbrains.annotations.NotNull;

public class Music implements Comparable<Music> {
    private String mname;
    private Integer playcount;

    public Music() {
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Integer getPlaycount() {
        return playcount;
    }

    public void setPlaycount(Integer playcount) {
        this.playcount = playcount;
    }

    public int compareTo(@NotNull Music o) {
        if(playcount == o.playcount){
            return mname.compareTo(o.getMname());
        }
        return  o.getPlaycount() - playcount;
    }
}
