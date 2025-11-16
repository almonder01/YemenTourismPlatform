package dao;

import model.User;
import util.DatabaseUtil;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;

public class UserDao {

    public void addUser(User user) {
        String sql = "INSERT INTO users (username, email, password_hash, role) VALUES (?, ?, ?, ?)";
        String hashedPassword = BCrypt.hashpw(user.getPasswordHash(), BCrypt.gensalt());
        try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, hashedPassword);
            ps.setString(4, user.getRole() != null ? user.getRole() : "user");
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        User user = null;
        try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPasswordHash(rs.getString("password_hash"));
                    user.setRole(rs.getString("role"));
                    user.setCreatedAt(rs.getTimestamp("created_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User validateUser(String username, String plainPassword) {
        User user = getUserByUsername(username);
        if (user != null && BCrypt.checkpw(plainPassword, user.getPasswordHash())) {
            return user;
        }
        return null;
    }

    public void updatePassword(int userId, String newPassword) {
        String sql = "UPDATE users SET password_hash = ? WHERE user_id = ?";
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        try (Connection conn = DatabaseUtil.get_connection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, hashedPassword);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public long getUserCount() {
        String sql = "SELECT COUNT(user_id) FROM users";
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
}