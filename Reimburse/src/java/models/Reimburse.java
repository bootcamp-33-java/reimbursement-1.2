/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Insane
 */
@Entity
@Table(name = "REIMBURSE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reimburse.findAll", query = "SELECT r FROM Reimburse r")
    , @NamedQuery(name = "Reimburse.findById", query = "SELECT r FROM Reimburse r WHERE r.id = :id")
    , @NamedQuery(name = "Reimburse.findByStartDate", query = "SELECT r FROM Reimburse r WHERE r.startDate = :startDate")
    , @NamedQuery(name = "Reimburse.findByEndDate", query = "SELECT r FROM Reimburse r WHERE r.endDate = :endDate")
    , @NamedQuery(name = "Reimburse.findByTotal", query = "SELECT r FROM Reimburse r WHERE r.total = :total")
    , @NamedQuery(name = "Reimburse.findByNotes", query = "SELECT r FROM Reimburse r WHERE r.notes = :notes")
    , @NamedQuery(name = "Reimburse.findByPeriod", query = "SELECT r FROM Reimburse r WHERE r.period = :period")})
public class Reimburse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    
    @Basic(optional = false)
    @Column(name = "START_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;
    
    @Basic(optional = false)
    @Column(name = "END_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    
    @Basic(optional = false)
    @Column(name = "TOTAL")
    private long total;
    
    @Column(name = "NOTES")
    private String notes;
    
    @Basic(optional = false)
    @Column(name = "PERIOD")
    private String period;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reimburse", fetch = FetchType.LAZY)
    private List<HistoryStatus> historyStatusList;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reimburse", fetch = FetchType.LAZY)
    private List<Ticket> ticketList;
    
    @JoinColumn(name = "EMPLOYEE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Employee employee;
    
    @JoinColumn(name = "CURRENT_STATUS", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Status currentStatus;

    public Reimburse() {
    }

    public Reimburse(Integer id) {
        this.id = id;
    }

    public Reimburse(Integer id, Date startDate, Date endDate, long total, String period, Employee employee, Status currentStatus) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.total = total;
        this.period = period;
        this.employee = employee;
        this.currentStatus = currentStatus;
    }

  

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    @XmlTransient
    public List<HistoryStatus> getHistoryStatusList() {
        return historyStatusList;
    }

    public void setHistoryStatusList(List<HistoryStatus> historyStatusList) {
        this.historyStatusList = historyStatusList;
    }

    @XmlTransient
    public List<Ticket> getTicketList() {
        return ticketList;
    }

    public void setTicketList(List<Ticket> ticketList) {
        this.ticketList = ticketList;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Status getCurrentStatus() {
        return currentStatus;
    }

    public void setCurrentStatus(Status currentStatus) {
        this.currentStatus = currentStatus;
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
        if (!(object instanceof Reimburse)) {
            return false;
        }
        Reimburse other = (Reimburse) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Reimburse[ id=" + id + " ]";
    }
    
}
