package dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Donation;

public class DonationDAO {
	
	private static String jdbcURL = "jdbc:mysql://localhost:3306/firestock";
	private static String dbUser = "root";
	private static String dbPassword = "root";
	
	public static List<Donation> getDonations() throws ClassNotFoundException {
		List<Donation> list = new ArrayList<Donation>();
		String QUERY_DONATIONS_SQL = "SELECT * FROM donation";
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager
				.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(QUERY_DONATIONS_SQL))
 		{
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Donation d = new Donation();
				d.setUserId(rs.getInt("userId"));
				d.setTypeId(rs.getInt("typeId"));
				d.setCountyId(rs.getInt("countyId"));
				d.setCityId(rs.getInt("cityId"));
				d.setQuantity(rs.getInt("quantity"));
				list.add(d);
				
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int getDonationById(int donatorId) throws ClassNotFoundException  {
		String GET_DONATION_ID = "SELECT donationId FROM donation where userId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		//0 if nothing found
		int donationId = 0;
		try (Connection connection = DriverManager
				.getConnection(jdbcURL, dbUser, dbPassword);
				PreparedStatement ps = connection.prepareStatement(GET_DONATION_ID))
 		{
			ps.setInt(1, donatorId);
			ResultSet result = ps.executeQuery();
			
			if (result.next()) {
				donationId = result.getInt("donationId");
			}
 		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		return donationId;
	}
	
	public static List<Donation> getUsersAllDonations(int userId) throws ClassNotFoundException {
		List<Donation> list = new ArrayList<Donation>();
		String GET_USERS_DONATIONS = "SELECT * FROM donation WHERE userId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager
				.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_USERS_DONATIONS))
 		{
			ps.setInt(1,  userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Donation d = new Donation();
				d.setUserId(rs.getInt("userId"));
				d.setTypeId(rs.getInt("typeId"));
				d.setCountyId(rs.getInt("countyId"));
				d.setCityId(rs.getInt("cityId"));
				d.setQuantity(rs.getInt("quantity"));
				list.add(d);
				
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}	
}
