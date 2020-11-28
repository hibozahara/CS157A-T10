package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.User;

public class UserDao {

	public int registerUser(User user) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO user" + 
				"(userId, email, name, password) VALUES " +
				"(?, ?, ?, ?);";
		
		int result = 0;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/Firestock", "", "");
				PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL)) 
		{
			ps.setInt(1, 16);
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getName());
			ps.setString(4, user.getPassword());
			
			System.out.println(ps);
			
			result = ps.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
