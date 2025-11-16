package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int userId;
    private int packageId;
    private Timestamp bookingDate;
    private String paymentStatus;
    private Date travelDate;
    private int numberOfTravelers; 
    private String specialRequests; 
    private BigDecimal totalPrice; 
    
    public Booking() {}
    
    public Date getTravelDate() { return travelDate; }
	public void setTravelDate(Date travelDate) { this.travelDate = travelDate; }

	public int getNumberOfTravelers() { return numberOfTravelers;}
	public void setNumberOfTravelers(int numberOfTravelers) { this.numberOfTravelers = numberOfTravelers;}

	public String getSpecialRequests() { return specialRequests;}
	public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests;}

	public BigDecimal getTotalPrice() { return totalPrice; }
	public void setTotalPrice(BigDecimal totalPrice) { this.totalPrice = totalPrice;}

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getPackageId() { return packageId; }
    public void setPackageId(int packageId) { this.packageId = packageId; }

    public Timestamp getBookingDate() { return bookingDate; }
    public void setBookingDate(Timestamp bookingDate) { this.bookingDate = bookingDate; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
}