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
import org.hibernate.HibernateException;

/**
 *
 * @author yuyun
 * @param <T> is class models
 */
public class GeneralDAO<T> {

    protected Session session;
    protected Transaction transaction;
    protected SessionFactory sessionFactory;
    protected T t;

    public GeneralDAO(SessionFactory sessionFactory, Class<T> t) {
        try {
            this.sessionFactory = sessionFactory;
            this.t = t.newInstance();
        } catch (IllegalAccessException | InstantiationException e) {
            e.printStackTrace();
        }
    }

    
    public List<T> getAll() {
        List<T> ts = new ArrayList<>();
        session = this.sessionFactory.openSession();
        transaction = session.beginTransaction();
        try {
            ts = session.createQuery("FROM " + t.getClass().getSimpleName() +" Order By 1").list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
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
        } catch (HibernateException e) {
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

