/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import java.lang.reflect.Field;

/**
 *
 * @author aqira
 */
public class GeneralDAO<T> {

    private Session session;
    private Transaction transaction;
    private SessionFactory sessionFactory;
    private T t;

    public GeneralDAO(SessionFactory sessionFactory, Class<T> t) {
        try {
            this.sessionFactory = sessionFactory;
            this.t = t.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
    public List<T> getData(Object key) {
        List<T> ts = new ArrayList<>();
        session = this.sessionFactory.openSession();
        transaction = session.beginTransaction();
        try {
//            Method GetAll
            String hql = "FROM " + t.getClass().getSimpleName() + (key == null ? "   " : " WHERE ");
//            
            for (Field field : t.getClass().getDeclaredFields()) {
                System.out.println(field.getName());
                if (!field.getName().matches(".*(List|UID)") && key != null) {
                    hql = hql + "LOWER(" + field.getName() + ") LIKE '%" + key + "%' OR ";
                }
            }
//            Menghilangkan OR dengan Substring
            hql = hql.substring(0, hql.length() - 3);
            System.out.println(hql);
            Query query = session.createQuery(hql);
            ts = query.list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return ts;
    }

  
    public T getById(Object key) {
        T hasil = null;
        session = this.sessionFactory.openSession();
        transaction = session.beginTransaction();
        try {
            String hql = "FROM " + t.getClass().getSimpleName() + " WHERE id = :x";
            Query query = session.createQuery(hql);
            query.setParameter("x", key);
            hasil = (T) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }

        return hasil;
    }

  
    public boolean saveOrDelete(T t, boolean isDelete) {
        boolean result = false;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            if (isDelete) {
                session.delete(t);
            } else {
                session.saveOrUpdate(t); //insert & update & delete
            }
            transaction.commit();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

}
