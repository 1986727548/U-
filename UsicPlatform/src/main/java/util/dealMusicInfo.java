package util;

import bean.Music;
import dao.MusicDao;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Random;

public class dealMusicInfo {

    public static void deal1(){
        MusicDao dao = MusicDao.getInstance();
        File file = new File("C:\\Users\\wangzhen\\IdeaProjects\\UsicPlatform\\web\\static\\audio");
        for(File file1 : file.listFiles()){
            System.out.println(file1.getName() + "->" + file1.getName().length());
            dao.addMusic(file1.getName(), 1);
        }
    }

    public static void deal2(){
        MusicDao dao = MusicDao.getInstance();
        Random random = new Random();
        String[] types = new String[]{"飙升榜", "新歌榜", "原创榜", "热歌榜"};
        for(int i = 0; i < 4; i++){
            int[] flag = new int[29];
            for(int j = 0; j < 15; j++){
                int val  =random.nextInt(28)+1;
                while(flag[val] != 0){
                    val  =random.nextInt(28)+1;
                }
                flag[val] = 1;
            }
            for(int j = 1; j <= 28; j++){
                if(flag[j] == 1){
                    dao.addMusicIntoType(types[i], j);
                    System.out.print(j+",");
                }
            }
            System.out.println();
        }
    }

    public static  void deal3(){
        MusicDao dao = MusicDao.getInstance();
        for(Music music : dao.getMusicFromType("飙升榜")){
            System.out.println(music.getMname());
        }
    }

    public static void deal4(){
        MusicDao dao = MusicDao.getInstance();
//        Alex Goot - Apologize.mp3

        dao.addOneCountIntoMusic(2, "Alex Goot - Apologize.mp3");
        System.out.println(dao.getOneCountFromMusic("Alex Goot - Apologize.mp3"));
    }

    public static void deal5(){
        MusicDao dao = MusicDao.getInstance();
        Random random = new Random();
        String type = "U音乐ACG音乐榜";
        File file = new File("C:\\CloudMusic\\U音乐ACG音乐榜");
        for(File file1 : file.listFiles()){
            System.out.println(file1.getName() + "->" + file1.getName().length());

            dao.addMusic(file1.getName(), 1);
            Integer mid = dao.getMidFromMusic(file1.getName());
            dao.addMusicIntoType(type, mid);
//            dao.deleteMusicFromType(mid);
//            dao.deleteMusic(mid);
        }

    }

    public static void main(String[] args){

        deal5();
    }
}
