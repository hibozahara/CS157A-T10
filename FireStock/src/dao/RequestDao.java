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

	public List<Integer> getRequestsByUserId(int userId) throws ClassNotFoundException {
		String GET_REQUEST = "SELECT donationId FROM request WHERE userId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		List<Integer> requests = new ArrayList<>();
		int donationId = 0;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_REQUEST)) {
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();

			while (result.next()) {
				donationId = result.getInt("donationId");
				requests.add(donationId);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return requests;
	}

	public void updateRequestToDeclineByDonationId(int donationId, int userId) throws ClassNotFoundException {
		String UPDATE_QUERY = "UPDATE request SET status = 'Declined' WHERE donationId = ? AND userId = ?";
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(UPDATE_QUERY)) {

			ps.setInt(1, donationId);
			ps.setInt(2, userId);
			ps.execute();

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void updateRequestToAcceptByDonationId(int donationId, int userId) throws ClassNotFoundException {
		String UPDATE_QUERY = "UPDATE request SET status = 'Accepted' WHERE donationId = ? AND userId = ?";
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(UPDATE_QUERY)) {

			ps.setInt(1, donationId);
			ps.setInt(2, userId);
			ps.execute();

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
