package dao;

import model.Booking;
import util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;
import model.BookingDetails;
import java.util.ArrayList;

public class BookingDao {

	public Booking createBooking(Booking booking) {
		String sql = "INSERT INTO bookings (user_id, package_id, travel_date, number_of_travelers, special_requests, total_price, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DatabaseUtil.get_connection();
				PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, booking.getUserId());
			ps.setInt(2, booking.getPackageId());
			ps.setDate(3, booking.getTravelDate());
			ps.setInt(4, booking.getNumberOfTravelers());

			if (booking.getSpecialRequests() != null && !booking.getSpecialRequests().isEmpty()) {
				ps.setString(5, booking.getSpecialRequests());
			} else {
				ps.setNull(5, Types.VARCHAR);
			}
			ps.setBigDecimal(6, booking.getTotalPrice());
			ps.setString(7, booking.getPaymentStatus());

			int affectedRows = ps.executeUpdate();

			if (affectedRows > 0) {
				try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
					if (generatedKeys.next()) {
						booking.setBookingId(generatedKeys.getInt(1));
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Database error while creating the booking.", e);
		}
		return booking;
	}

	public List<BookingDetails> getBookingsByUser(int userId) {
        List<BookingDetails> bookingDetailsList = new ArrayList<>();
        String sql = "SELECT b.booking_id, b.travel_date, b.number_of_travelers, b.total_price, b.payment_status, " +
                     "p.name AS package_name, d.name AS destination_name " +
                     "FROM bookings b " +
                     "JOIN packages p ON b.package_id = p.package_id " +
                     "JOIN destinations d ON p.destination_id = d.destination_id " +
                     "WHERE b.user_id = ? " +
                     "ORDER BY b.travel_date DESC";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BookingDetails details = new BookingDetails();
                    details.setBookingId(rs.getInt("booking_id"));
                    details.setTravelDate(rs.getDate("travel_date"));
                    details.setNumberOfTravelers(rs.getInt("number_of_travelers"));
                    details.setTotalPrice(rs.getBigDecimal("total_price"));
                    details.setPaymentStatus(rs.getString("payment_status"));
                    details.setPackageName(rs.getString("package_name"));
                    details.setDestinationName(rs.getString("destination_name"));
                    bookingDetailsList.add(details);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingDetailsList;
	}
	
    public long getBookingCount() {
        String sql = "SELECT COUNT(booking_id) FROM bookings";
        long count = 0;
        try (Connection conn = DatabaseUtil.get_connection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                count = rs.getLong(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<BookingDetails> getRecentBookings(int limit) {
        List<BookingDetails> recentBookings = new ArrayList<>();
        String sql = "SELECT b.*, u.username, p.name as package_name FROM bookings b " +
                     "JOIN users u ON b.user_id = u.user_id " +
                     "JOIN packages p ON b.package_id = p.package_id " +
                     "ORDER BY b.booking_date DESC LIMIT ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BookingDetails details = new BookingDetails();
                    details.setBookingId(rs.getInt("booking_id"));
                    details.setUsername(rs.getString("username")); 
                    details.setPackageName(rs.getString("package_name"));
                    details.setBookingDate(rs.getTimestamp("booking_date"));
                    details.setTotalPrice(rs.getBigDecimal("total_price"));
                    details.setPaymentStatus(rs.getString("payment_status"));
                    recentBookings.add(details);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recentBookings;
    }

    public List<BookingDetails> getAllBookings() {
        List<BookingDetails> bookingDetailsList = new ArrayList<>();
        String sql = "SELECT b.*, u.username, p.name AS package_name, d.name AS destination_name " +
                     "FROM bookings b " +
                     "JOIN users u ON b.user_id = u.user_id " +
                     "JOIN packages p ON b.package_id = p.package_id " +
                     "JOIN destinations d ON p.destination_id = d.destination_id " +
                     "ORDER BY b.booking_date DESC";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                BookingDetails details = new BookingDetails();
                details.setBookingId(rs.getInt("booking_id"));
                details.setTravelDate(rs.getDate("travel_date"));
                details.setBookingDate(rs.getTimestamp("booking_date"));
                details.setNumberOfTravelers(rs.getInt("number_of_travelers"));
                details.setTotalPrice(rs.getBigDecimal("total_price"));
                details.setPaymentStatus(rs.getString("payment_status"));
                details.setPackageName(rs.getString("package_name"));
                details.setDestinationName(rs.getString("destination_name"));
                details.setUsername(rs.getString("username"));
                bookingDetailsList.add(details);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingDetailsList;
    }
    
    public void updateBookingStatus(int bookingId, String newStatus) {
        String sql = "UPDATE bookings SET payment_status = ? WHERE booking_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, bookingId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public BookingDetails getBookingDetailsById(int bookingId) {
        BookingDetails details = null;
        String sql = "SELECT b.*, u.username, p.name AS package_name, d.name AS destination_name " +
                     "FROM bookings b " +
                     "JOIN users u ON b.user_id = u.user_id " +
                     "JOIN packages p ON b.package_id = p.package_id " +
                     "JOIN destinations d ON p.destination_id = d.destination_id " +
                     "WHERE b.booking_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookingId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    details = new BookingDetails();
                    details.setBookingId(rs.getInt("booking_id"));
                    details.setTravelDate(rs.getDate("travel_date"));
                    details.setBookingDate(rs.getTimestamp("booking_date"));
                    details.setNumberOfTravelers(rs.getInt("number_of_travelers"));
                    details.setSpecialRequests(rs.getString("special_requests"));
                    details.setTotalPrice(rs.getBigDecimal("total_price"));
                    details.setPaymentStatus(rs.getString("payment_status"));
                    details.setPackageName(rs.getString("package_name"));
                    details.setDestinationName(rs.getString("destination_name"));
                    details.setUsername(rs.getString("username"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }
    
    public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM bookings WHERE booking_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, bookingId);
            
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
            
        } catch (SQLException e) {
            System.err.println("Error deleting booking with ID " + bookingId + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}