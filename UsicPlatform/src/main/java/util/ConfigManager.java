package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigManager {
    private Properties properties = new Properties();
    private InputStream in;
    private static ConfigManager configManager = new ConfigManager();

    private ConfigManager(){
        in = ConfigManager.class.getClassLoader().getResourceAsStream("database.properties");
        try{
            properties.load(in);
            in.close();
        }catch (IOException e){
            e.printStackTrace();
        }

    }

    public static  ConfigManager getInstance(){
        return configManager;
    }

    public String getValue(String key){
        return properties.getProperty(key);
    }


}
