package dao;

import model.Destination;
import util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DestinationDao {

	public List<Destination> getAllDestinations() {
		List<Destination> destinations = new ArrayList<>();
		String sql = "SELECT destination_id, name, summary, description, image_url, is_featured FROM destinations ORDER BY name ASC";
		try (Connection conn = DatabaseUtil.get_connection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Destination dest = new Destination();
				dest.setDestinationId(rs.getInt("destination_id"));
				dest.setName(rs.getString("name"));
				dest.setSummary(rs.getString("summary"));
				dest.setDescription(rs.getString("description"));
				dest.setImageUrl(rs.getString("image_url"));
				dest.setFeatured(rs.getBoolean("is_featured"));
				destinations.add(dest);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return destinations;
	}

	public List<Destination> getFeaturedDestinations(int limit) {
		List<Destination> destinations = new ArrayList<>();
		String sql = "SELECT destination_id, name, summary, description, image_url, is_featured FROM destinations WHERE is_featured = TRUE ORDER BY name ASC LIMIT ?";
		try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, limit);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Destination dest = new Destination();
					dest.setDestinationId(rs.getInt("destination_id"));
					dest.setName(rs.getString("name"));
					dest.setSummary(rs.getString("summary"));
					dest.setDescription(rs.getString("description"));
					dest.setImageUrl(rs.getString("image_url"));
				    dest.setFeatured(rs.getBoolean("is_featured"));
					destinations.add(dest);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return destinations;
	}

	public long getDestinationCount() {
		String sql = "SELECT COUNT(destination_id) FROM destinations";
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

	public Destination getDestinationById(int destinationId) {
		Destination dest = null;
		String sql = "SELECT destination_id, name, summary, description, image_url, is_featured FROM destinations WHERE destination_id = ?";
		try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, destinationId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					dest = new Destination();
					dest.setDestinationId(rs.getInt("destination_id"));
					dest.setName(rs.getString("name"));
					dest.setSummary(rs.getString("summary"));
					dest.setDescription(rs.getString("description"));
					dest.setImageUrl(rs.getString("image_url"));
					dest.setFeatured(rs.getBoolean("is_featured"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dest;
	}

	public void addDestination(Destination destination) {
	    String sql = "INSERT INTO destinations (name, summary, description, image_url, is_featured) VALUES (?, ?, ?, ?, ?)";
	    try (Connection conn = DatabaseUtil.get_connection(); 
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, destination.getName());
	        ps.setString(2, destination.getSummary());
	        ps.setString(3, destination.getDescription());
	        ps.setString(4, destination.getImageUrl());
	        ps.setBoolean(5, destination.isFeatured());
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	public void updateDestination(Destination destination) {
		String sql = "UPDATE destinations SET name = ?, summary = ?, description = ?, image_url = ?, is_featured = ? WHERE destination_id = ?";
		try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, destination.getName());
			ps.setString(2, destination.getSummary());
			ps.setString(3, destination.getDescription());
			ps.setString(4, destination.getImageUrl());
			ps.setBoolean(5, destination.isFeatured());
			ps.setInt(6, destination.getDestinationId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteDestination(int destinationId) {
		String sql = "DELETE FROM destinations WHERE destination_id = ?";
		try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, destinationId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}