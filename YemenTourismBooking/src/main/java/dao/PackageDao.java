package dao;

import model.Package;
import util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PackageDao {

    public List<Package> getPackagesByDestinationId(int destinationId) { 
        List<Package> packages = new ArrayList<>();
        String sql = "SELECT * FROM packages WHERE destination_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, destinationId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Package pkg = new Package();
                    pkg.setPackageId(rs.getInt("package_id"));
                    pkg.setDestinationId(rs.getInt("destination_id"));
                    pkg.setName(rs.getString("name"));
                    pkg.setDescription(rs.getString("description"));
                    pkg.setPrice(rs.getBigDecimal("price"));
                    packages.add(pkg);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return packages;
    }

    public Package getPackageById(int packageId) {
        Package pkg = null;
        String sql = "SELECT * FROM packages WHERE package_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, packageId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    pkg = new Package();
                    pkg.setPackageId(rs.getInt("package_id"));
                    pkg.setDestinationId(rs.getInt("destination_id"));
                    pkg.setName(rs.getString("name"));
                    pkg.setDescription(rs.getString("description"));
                    pkg.setPrice(rs.getBigDecimal("price"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pkg;
    }

    public void addPackage(Package pkg) {
        String sql = "INSERT INTO packages (destination_id, name, description, price) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pkg.getDestinationId());
            ps.setString(2, pkg.getName());
            ps.setString(3, pkg.getDescription());
            ps.setBigDecimal(4, pkg.getPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePackage(Package pkg) {
        String sql = "UPDATE packages SET name = ?, description = ?, price = ? WHERE package_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, pkg.getName());
            ps.setString(2, pkg.getDescription());
            ps.setBigDecimal(3, pkg.getPrice());
            ps.setInt(4, pkg.getPackageId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePackage(int packageId) {
        String sql = "DELETE FROM packages WHERE package_id = ?";
        try (Connection conn = DatabaseUtil.get_connection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, packageId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}