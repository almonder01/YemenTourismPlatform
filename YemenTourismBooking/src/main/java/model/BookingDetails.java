package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class BookingDetails {
    private int bookingId;
    private Date travelDate;
    private Timestamp bookingDate;
    private int numberOfTravelers;
    private BigDecimal totalPrice;
    private String paymentStatus;
    private String packageName;
    private String destinationName;
    private String username;
    private String specialRequests;

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public Date getTravelDate() { return travelDate; }
    public void setTravelDate(Date travelDate) { this.travelDate = travelDate; }

    public Timestamp getBookingDate() { return bookingDate; }
    public void setBookingDate(Timestamp bookingDate) { this.bookingDate = bookingDate; }

    public int getNumberOfTravelers() { return numberOfTravelers; }
    public void setNumberOfTravelers(int numberOfTravelers) { this.numberOfTravelers = numberOfTravelers; }

    public BigDecimal getTotalPrice() { return totalPrice; }
    public void setTotalPrice(BigDecimal totalPrice) { this.totalPrice = totalPrice; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getPackageName() { return packageName; }
    public void setPackageName(String packageName) { this.packageName = packageName; }

    public String getDestinationName() { return destinationName; }
    public void setDestinationName(String destinationName) { this.destinationName = destinationName; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getSpecialRequests() { return specialRequests; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }
}