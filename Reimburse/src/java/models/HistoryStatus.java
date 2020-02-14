/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Insane
 */
@Entity
@Table(name = "HISTORY_STATUS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HistoryStatus.findAll", query = "SELECT h FROM HistoryStatus h")
    , @NamedQuery(name = "HistoryStatus.findById", query = "SELECT h FROM HistoryStatus h WHERE h.id = :id")
    , @NamedQuery(name = "HistoryStatus.findByNotes", query = "SELECT h FROM HistoryStatus h WHERE h.notes = :notes")
    , @NamedQuery(name = "HistoryStatus.findByHistoryDate", query = "SELECT h FROM HistoryStatus h WHERE h.historyDate = :historyDate")})
public class HistoryStatus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NOTES")
    private String notes;
    @Basic(optional = false)
    @Column(name = "HISTORY_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date historyDate;
    @JoinColumn(name = "REIMBURSE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Reimburse reimburse;
    @JoinColumn(name = "STATUS", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Status status;

    public HistoryStatus() {
    }

    public HistoryStatus(Integer id) {
        this.id = id;
    }

    public HistoryStatus(Integer id, String notes, Date historyDate) {
        this.id = id;
        this.notes = notes;
        this.historyDate = historyDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Date getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(Date historyDate) {
        this.historyDate = historyDate;
    }

    public Reimburse getReimburse() {
        return reimburse;
    }

    public void setReimburse(Reimburse reimburse) {
        this.reimburse = reimburse;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
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
        if (!(object instanceof HistoryStatus)) {
            return false;
        }
        HistoryStatus other = (HistoryStatus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.HistoryStatus[ id=" + id + " ]";
    }
    
}
