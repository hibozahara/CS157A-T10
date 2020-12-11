package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountyDao {

	private static String jdbcURL = "jdbc:mysql://localhost:3306/firestock";
	private static String dbUser = "root";
	private static String dbPassword = "root";

	public int getCountyIdByName(String countyName) throws ClassNotFoundException {
		String GET_COUNTYID = "SELECT countyId FROM county WHERE countyName = ?";
		Class.forName("com.mysql.jdbc.Driver");
		int id = 0;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_COUNTYID)) {
			ps.setString(1, countyName);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				id = result.getInt("countyId");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public String getCountyNameById(int countyId) throws ClassNotFoundException {
		String GET_COUNTYNAME = "SELECT countyName FROM county WHERE countyId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		String name = null;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_COUNTYNAME)) {
			ps.setInt(1, countyId);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				name = result.getString("countyName");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
}
