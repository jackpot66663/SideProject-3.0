package dao;

import com.sun.xml.internal.ws.handler.HandlerException;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import pojo.model.AccountEntity;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;


public class AccountDAO {
    public static Logger logger = Logger.getLogger(AccountDAO.class);

    public static String getPasswordByUsername(String username) {
        Session session = HibernateUtil.getSession();
        String password = "";
        List result = null;

        try {
            result = session.createQuery(
                    "select account.password from AccountEntity as account where account.account =:username")
                    .setParameter("username", username)
                    .list();
            password = result.get(0).toString();

        } catch (HandlerException e) {
            logger.error("HibernateGetPasswordFailed:", e);
        } finally {
            session.close();
        }

        return password;
    }

    public static void insertNewAccount(String username, String password) {
        Session session = HibernateUtil.getSession();

        AccountEntity newAccount = new AccountEntity();
        newAccount.setAccount(username);
        newAccount.setPassword(password);

        try {
            session.save(newAccount);
        } catch (HandlerException e) {
            logger.error("HibernateCreateAccountFailed:", e);
        } finally {
            session.close();
        }

    }

    public static Boolean checkAccountByUsername(String username) {
        boolean isAccountExist = false;
        Session session = HibernateUtil.getSession();
        List result = null;
        try {
            result = session.createQuery(
                    "select account.account from AccountEntity as account").list();

            if (result.size() > 0) {
                for(Object name:result){
                    if(name.toString().equals(username)){
                        isAccountExist = true;
                    }
                }
            }

        } catch (HandlerException e) {
            logger.error("HibernateCan'tFindUsernameFailed:", e);
        } finally {
            session.close();
        }


        return isAccountExist;
    }
}
