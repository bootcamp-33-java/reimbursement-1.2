/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import models.Employee;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author FIKRI-PC
 */
public class EmployeeDAO extends GeneralDAO<Employee>{

    public EmployeeDAO(SessionFactory sessionFactory, Class<Employee> t) {
        super(sessionFactory, t);
    }

    
 
    public Employee getByEmail(Object key) {
        Employee hasil = null;
        session = this.sessionFactory.openSession();
        transaction = session.beginTransaction();
        try {
            String hql = "FROM Employee WHERE EMAIL = :x";
            Query query = session.createQuery(hql);
            query.setParameter("x", key);
            hasil = (Employee) query.uniqueResult();
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
}
