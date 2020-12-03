package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RequestDao {

	private static String jdbcURL = "jdbc:mysql://localhost:3306/firestock";
	private static String dbUser = "root";
	private static String dbPassword = "root";
	
	public int addRequest(int currentUserId, int donatorId) throws ClassNotFoundException {
		String ADD_REQUEST = "INSERT IGNORE INTO request (userId, donationId, status) VALUES (?, ?, ?)";
		Class.forName("com.mysql.jdbc.Driver");
		int result = 0;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(ADD_REQUEST)) {
			ps.setInt(1, currentUserId);
			ps.setInt(2, donatorId);
			ps.setString(3, "Pending");
			result = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
