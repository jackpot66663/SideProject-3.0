package dao;

import com.sun.xml.internal.ws.handler.HandlerException;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import pojo.model.GameScoreboardEntity;
import util.HibernateUtil;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

public class GameDAO {
    public static Logger logger = Logger.getLogger(GameDAO.class);

    public static List<GameScoreboardEntity> getallRecord() {
        Session session = HibernateUtil.getSession();
        List<GameScoreboardEntity> list = null;
        try {
            list = session.createQuery("from GameScoreboardEntity").getResultList();
        } catch (HandlerException e) {
            logger.error("HibernateCan'tFindUsernameFailed:", e);
        } finally {
            session.close();
        }
        return list;
    }

    public static boolean checkRecordByUsername(String username) {
        Session session = HibernateUtil.getSession();
        List result = null;
        boolean isFirst = true;
        try {
            result = session.createQuery(
                    "select game.account from GameScoreboardEntity as game where game.account =:username")
                    .setParameter("username", username)
                    .list();
            if (result.size() == 1) {
                isFirst = false;
            }
        } catch (HandlerException e) {
            logger.error("HibernateCan'tGetUsernameFailed:", e);
        } finally {
            session.close();
        }

        return isFirst;
    }

    public static void insertNewRecord(String username, String status) {
        Session session = HibernateUtil.getSession();
        Timestamp time = new Timestamp(System.currentTimeMillis());
        GameScoreboardEntity record = new GameScoreboardEntity();
        if (status.equals("fail")) {
            status = "未通關";
        } else {
            status = "通關";
        }
        record.setAccount(username);
        record.setStatus(status);
        record.setUpdatetime(time);

        try {
            session.save(record);
        } catch (HandlerException e) {
            logger.error("HibernateCreateRecordFailed:", e);
        } finally {
            session.close();
        }
    }

    public static void updateRecordByUsername(String account, String status) {
        Session session = HibernateUtil.getSession();
        Timestamp time = new Timestamp(System.currentTimeMillis());
        Transaction transaction = null;
        if (status.equals("fail")) {
            status = "未通關";
        } else {
            status = "通關";
        }
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery(
                    "update GameScoreboardEntity as game " +
                            "set game.status =:status , game.updatetime =:time " +
                            "where game.account =: username")
                    .setParameter("status", status)
                    .setParameter("time", time)
                    .setParameter("username", account);
            query.executeUpdate();
            transaction.commit();
        } catch (HandlerException e) {
            logger.error("HibernateUpdateFailed:", e);
        } finally {
            session.close();
        }
    }
}
