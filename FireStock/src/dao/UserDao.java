package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import utility.SecureUtils;

public class UserDao {

	private static String jdbcURL = "jdbc:mysql://localhost:3306/firestock";
	private static String dbUser = "root";
	private static String dbPassword = "root";

	public int registerUser(User user) throws ClassNotFoundException, NoSuchAlgorithmException {
		String INSERT_USERS_SQL = "INSERT INTO user" + "(email, name, password, salt) VALUES " + "(?, ?, ?, ?);";

		int result = 0;

		Class.forName("com.mysql.jdbc.Driver");

		SecureUtils util = new SecureUtils();

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL)) {
			// Salt and hash password
			byte[] salt = util.getSalt();
			String securePassword = util.getSecurePassword(user.getPassword(), salt);

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setString(3, securePassword);
			ps.setBytes(4, salt);

			result = ps.executeUpdate();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public User checkLogin(String email, String password, byte[] salt) throws SQLException, ClassNotFoundException {
		String FIND_USER_SQL = "SELECT * FROM user WHERE email = ? and password = ?";
		Class.forName("com.mysql.jdbc.Driver");

		User user = null;
		SecureUtils util = new SecureUtils();

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
				PreparedStatement ps = connection.prepareStatement(FIND_USER_SQL)) {
			// compute password with salt from db

			String securePassword = util.getSecurePassword(password, salt);

			ps.setString(1, email);
			ps.setString(2, securePassword);

			ResultSet result = ps.executeQuery();

			if (result.next()) {
				user = new User();
				user.setName(result.getString("name"));
				user.setEmail(email);
			}

			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;

	}

	public byte[] getSaltFromDB(String email) throws ClassNotFoundException {
		String FIND_USER_SALT = "SELECT salt FROM user WHERE email = ?";
		byte[] salt = null;
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
				PreparedStatement ps = connection.prepareStatement(FIND_USER_SALT)) {
			// get salt from database
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				salt = result.getBytes("salt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return salt;
	}

	public User getUserById(int userId) throws ClassNotFoundException {

		String GET_USER_NAME = "SELECT * FROM user WHERE userId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		User user = null;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_USER_NAME)) {
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				user = new User();
				user.setEmail(result.getString("email"));
				user.setName(result.getString("name"));
				user.setPassword(result.getString("password"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public String getUserNameById(int userId) throws ClassNotFoundException {

		String GET_USER_NAME = "SELECT name FROM user WHERE userId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		String name = null;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_USER_NAME)) {
			ps.setInt(1, userId);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				name = result.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}

	public int getUserIdByEmail(String email) throws ClassNotFoundException {
		String GET_USERID = "SELECT userId FROM user WHERE email = ?";
		Class.forName("com.mysql.jdbc.Driver");
		int userId = 0;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_USERID)) {
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				userId = result.getInt("userId");

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userId;
	}

}
