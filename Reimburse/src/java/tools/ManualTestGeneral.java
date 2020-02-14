/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import daos.GeneralDAO;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import models.Employee;
import models.Role;

import org.hibernate.SessionFactory;

/**
 *
 * @author aqira
 */
public class ManualTestGeneral {

    private static final SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // ---------------------------------------- Deklarasi DAO ----------------------------------------//

        GeneralDAO<Employee> edao = new GeneralDAO<>(sessionFactory, Employee.class);
        GeneralDAO<Role> roledao = new GeneralDAO<>(sessionFactory, Role.class);
        //        GeneralDAO<Account> adao = new GeneralDAO<>(sessionFactory, Account.class);

        // ---------------------------------------- Testing  ----------------------------------------//       
        //Get By ID
        //        Region region = rdao.getById("4");
        //        System.out.println(region.getId());
        //        System.out.println(region.getName());
        //Get Daata
        //        for (Department d : igdao.getData("11")) {
        //            System.out.println(d.getId()+ "\n" + d.getName());
        //            System.out.println(d.getManagerial()== null ? "0" : d.getManagerial().getId());
        //            System.out.println(d.getLocation().getId() + "\n");
        //        }
        //SAVE OR DELETE
//        public Employee(String id, String name, String email, boolean isActive, Date hireDate, String phoneNumber) {
        Employee employee = new Employee("HERU", "bagus iini", "agung@sbb.com", false, Date.valueOf("2000-10-10"), "08232121232");
//        Employee employee2 = new Employee(16);
        System.out.println(edao.saveOrDelete(employee, false));
        Role rolee = new Role("NG", "GORENG");
        System.out.println(roledao.saveOrDelete(rolee, false));
//DEPARTMENT END ------------------------------------------------------------------------
        //Spesial aja
        //Lain-lain
        //        for (Role t : roledao.getData(null)) {
        //            System.out.print(t.getId() + "  | ");
        //            System.out.println(t.getName()+ " | ");
        //        }
        //Save ato Update ato Delete
        /*      
        //Region
        System.out.println(rdao.saveOrDelete(new Region(new BigDecimal(11), "coba"), false));
        System.out.println(rdao.saveOrDelete(new Region (new BigDecimal(11), "cobaa"), false));
        System.out.println(rdao.saveOrDelete(new Region (new BigDecimal(11), "coba"), true));
         */ /*
        //Country
        System.out.println(cdao.saveOrDelete(new Country("ad", "asasasa", new Region(new BigDecimal(11))), false));
        System.out.println(cdao.saveOrDelete(new Country("ad", "asasasaaa", new Region(new BigDecimal(11))), false));
        System.out.println(cdao.saveOrDelete(new Country("ad", "asasasa", new Region(new BigDecimal(11))), true));
         */
    }
}
