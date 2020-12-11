package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeDao {

	private static String jdbcURL = "jdbc:mysql://localhost:3306/firestock";
	private static String dbUser = "root";
	private static String dbPassword = "root";

	public int getTypeIdByName(String typeName) throws ClassNotFoundException {
		String GET_TYPEID = "SELECT * FROM type WHERE typeName = ?";
		Class.forName("com.mysql.jdbc.Driver");
		int id = 0;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_TYPEID)) {
			ps.setString(1, typeName);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				id = result.getInt("typeId");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public String getTypeNameById(int typeId) throws ClassNotFoundException {
		String GET_TYPENAME = "SELECT typeName FROM type WHERE typeId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		String name = null;
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_TYPENAME)) {
			ps.setInt(1, typeId);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				name = result.getString("typeName");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}
}
