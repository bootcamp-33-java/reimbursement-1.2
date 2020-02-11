/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author FIKRI-PC
 */
@Entity
@Table(name = "EMPLOYEE_ROLE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmployeeRole.findAll", query = "SELECT e FROM EmployeeRole e")
    , @NamedQuery(name = "EmployeeRole.findById", query = "SELECT e FROM EmployeeRole e WHERE e.id = :id")
    , @NamedQuery(name = "EmployeeRole.findByRole", query = "SELECT e FROM EmployeeRole e WHERE e.role = :role")})
public class EmployeeRole implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private BigDecimal id;
    @Basic(optional = false)
    @Column(name = "ROLE")
    private String role;
    @JoinColumn(name = "EMPLOYEE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Employee employee;

    public EmployeeRole() {
    }

    public EmployeeRole(BigDecimal id) {
        this.id = id;
    }

    public EmployeeRole(BigDecimal id, String role) {
        this.id = id;
        this.role = role;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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
        if (!(object instanceof EmployeeRole)) {
            return false;
        }
        EmployeeRole other = (EmployeeRole) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.EmployeeRole[ id=" + id + " ]";
    }
    
}
