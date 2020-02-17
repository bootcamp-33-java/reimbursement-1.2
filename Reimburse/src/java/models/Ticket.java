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
@Table(name = "TICKET")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ticket.findAll", query = "SELECT t FROM Ticket t")
    , @NamedQuery(name = "Ticket.findById", query = "SELECT t FROM Ticket t WHERE t.id = :id")
    , @NamedQuery(name = "Ticket.findByUploadDate", query = "SELECT t FROM Ticket t WHERE t.uploadDate = :uploadDate")
    , @NamedQuery(name = "Ticket.findByPhotoTicket", query = "SELECT t FROM Ticket t WHERE t.photoTicket = :photoTicket")
    , @NamedQuery(name = "Ticket.findByPrice", query = "SELECT t FROM Ticket t WHERE t.price = :price")})
public class Ticket implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    
    @Basic(optional = false)
    @Column(name = "UPLOAD_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date uploadDate;
    
    @Basic(optional = false)
    @Column(name = "PHOTO_TICKET")
    private String photoTicket;
    
    @Basic(optional = false)
    @Column(name = "PRICE")
    private long price;
    
    @JoinColumn(name = "PARKING_LOT", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private ParkingLot parkingLot;
    
    @JoinColumn(name = "REIMBURSE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Reimburse reimburse;
    
    @JoinColumn(name = "VEHICLE", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Vehicle vehicle;

    public Ticket() {
    }

    public Ticket(Integer id) {
        this.id = id;
    }

    public Ticket(Integer id, Date uploadDate, String photoTicket, long price, ParkingLot parkingLot, Reimburse reimburse, Vehicle vehicle) {
        this.id = id;
        this.uploadDate = uploadDate;
        this.photoTicket = photoTicket;
        this.price = price;
        this.parkingLot = parkingLot;
        this.reimburse = reimburse;
        this.vehicle = vehicle;
    }

  
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getPhotoTicket() {
        return photoTicket;
    }

    public void setPhotoTicket(String photoTicket) {
        this.photoTicket = photoTicket;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public ParkingLot getParkingLot() {
        return parkingLot;
    }

    public void setParkingLot(ParkingLot parkingLot) {
        this.parkingLot = parkingLot;
    }

    public Reimburse getReimburse() {
        return reimburse;
    }

    public void setReimburse(Reimburse reimburse) {
        this.reimburse = reimburse;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
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
        if (!(object instanceof Ticket)) {
            return false;
        }
        Ticket other = (Ticket) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Ticket[ id=" + id + " ]";
    }
    
}
