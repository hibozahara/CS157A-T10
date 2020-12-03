package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CityDao {

	private static String jdbcURL = "jdbc:mysql://localhost:3306/firestock";
	private static String dbUser = "root";
	private static String dbPassword = "root";
	
	public int getCityIdByName(String cityName) throws ClassNotFoundException {
		String GET_CITYID = "SELECT cityId FROM city WHERE cityName = ?";
		Class.forName("com.mysql.jdbc.Driver");
		int id = 0;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_CITYID)) {
			ps.setString(1, cityName);
			ResultSet result = ps.executeQuery();
			
			if(result.next()) {
				id = result.getInt("cityId");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public String getCityNameById(int cityId) throws ClassNotFoundException {
		String GET_CITYNAME = "SELECT cityName FROM city WHERE cityId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		String name = null;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_CITYNAME)) {
			ps.setInt(1, cityId);
			ResultSet result = ps.executeQuery();
			
			if(result.next()) {
				name = result.getString("cityName");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
}
