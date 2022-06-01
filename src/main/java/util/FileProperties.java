package util;

import org.apache.log4j.Logger;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class FileProperties {
    private static Logger log = Logger.getLogger(FileProperties.class);
    private static Properties properties = null;
    private static FileProperties FileProperties= null;

    private FileProperties() {
        InputStream inputStream;
        if (properties == null) {
            properties = new Properties();
            try {
                inputStream = getClass().getClassLoader().getResourceAsStream("config.properties");
                if(inputStream!=null){
                    properties.load(inputStream);
                }
            } catch (FileNotFoundException ex) {
                log.error("config.properties NOT FOUND");
                log.error(ex, ex);
            } catch (IOException ex) {
                log.error("config.properties IO EXCEPTION");
                log.error(ex, ex);
            }
        }
    }

    public static FileProperties getInstance() {
        if (FileProperties== null) {
            FileProperties = new FileProperties();
        }
        return FileProperties;
    }

    public boolean hasProperty(String key) {
        if (properties != null) {
            return properties.containsKey(key);
        } else {
            log.error("The 'properties' is null");
            return false;
        }
    }

    /**
     * 給予一key值，獲得對應的Property (String)
     *
     * @param key 參數設定key
     * @return 對應的Property
     */
    public String getProperty(String key) {
        String value = properties.getProperty(key);
        if (value == null) {
            log.error("Property Key:[" + key + "] NOT EXIST IN CONFIG");
        }
        return value;
    }

    /**
     * 給予一key值，獲得對應的Property (Int)
     *
     * @param key 參數設定key
     * @return 對應的Property
     */
    public int getIntProperty(String key) {
        String value = null;
        int number = -1;
        try {
            value = properties.getProperty(key);
            number = Integer.valueOf(value);
        } catch (NumberFormatException ex) {
            log.error("Number Format Error:[" + value + "]");
            log.error(ex, ex);
        } catch (NullPointerException ex) {
            log.error("Property Key:[" + key + "] NOT EXIST IN CONFIG");
            log.error(ex, ex);
        }
        return number;
    }

    /**
     * 給予一key值，獲得對應的Property (Boolean)
     *
     * @param key 參數設定key
     * @return 對應的Property
     */
    public boolean getBooleanProperty(String key) {
        String value = null;
        boolean flag = false;
        try {
            value = properties.getProperty(key);
            flag = Boolean.valueOf(value);
        } catch (NumberFormatException ex) {
            log.error("Number Format Error:[" + value + "]");
            log.error(ex, ex);
        } catch (NullPointerException ex) {
            log.error("Property Key:[" + key + "] NOT EXIST IN CONFIG");
            log.error(ex, ex);
        }
        return flag;
    }
}