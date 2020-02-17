/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Insane
 */
@Entity
@Table(name = "ACCOUNT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a")
    , @NamedQuery(name = "Account.findById", query = "SELECT a FROM Account a WHERE a.id = :id")
    , @NamedQuery(name = "Account.findByPassword", query = "SELECT a FROM Account a WHERE a.password = :password")
    , @NamedQuery(name = "Account.findByToken", query = "SELECT a FROM Account a WHERE a.token = :token")
    , @NamedQuery(name = "Account.findByIsVerify", query = "SELECT a FROM Account a WHERE a.isVerify = :isVerify")})
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    
    @Basic(optional = false)
    @Column(name = "PASSWORD")
    private String password;
    
    @Basic(optional = false)
    @Column(name = "TOKEN")
    private String token;
    
    @Basic(optional = false)
    @Column(name = "IS_VERIFY")
    private boolean isVerify;
    
    @JoinColumn(name = "ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @OneToOne(optional = false, fetch = FetchType.LAZY)
    private Employee employee;

    public Account() {
    }

    public Account(String id) {
        this.id = id;
    }

    public Account(String id, String password, String token, boolean isVerify, Employee employee) {
        this.id = id;
        this.password = password;
        this.token = token;
        this.isVerify = isVerify;
        this.employee = employee;
    }

    public Account(String id, String password, String token, boolean isVerify) {
        this.id = id;
        this.password = password;
        this.token = token;
        this.isVerify = isVerify;
    }

    public Account(String id, String password, String token, String isVerify, Employee employee) {
        this.id = id;
        this.password = password;
        this.token = token;
        this.isVerify = isVerify;
        this.employee = employee;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public boolean getIsVerify() {
        return isVerify;
    }

    public void setIsVerify(boolean isVerify) {
        this.isVerify = isVerify;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Account[ id=" + id + " ]";
    }

}
