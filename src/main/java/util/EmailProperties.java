package util;

import java.util.Properties;

public class EmailProperties {
    public static String host = FileProperties.getInstance().getProperty("host");
    public static int port = FileProperties.getInstance().getIntProperty("port");

    public static Properties set(){
        Properties prop = new Properties();
        prop.put("mail.smtp.host",host);
        prop.put("mail.smtp.port",port);
        prop.put("mail.smtp.auth","true");
        prop.put("mail.smtp.socketFactory.port","true");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        return prop;
    }
}
