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
import model.User;
import utility.SecureUtils;

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
				d.setDonationId(rs.getInt("donationId"));
				d.setUserId(rs.getInt("userId"));
				d.setTitle(rs.getString("title"));
				d.setTypeId(rs.getInt("typeId"));
				d.setCountyId(rs.getInt("countyId"));
				d.setCityId(rs.getInt("cityId"));
				d.setQuantity(rs.getInt("quantity"));
				d.setPicture(rs.getString("picture"));
				d.setContact(rs.getString("contactInfo"));
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
	
	public static Donation getDonationByDonationId(int donationId) throws ClassNotFoundException {
//		List<Donation> list = new ArrayList<Donation>();
		String GET_A_DONATION_BY_DONATION_ID = "SELECT * FROM donation WHERE donationId = ?";
		Class.forName("com.mysql.jdbc.Driver");
		Donation d = new Donation();
		try (Connection connection = DriverManager
				.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(GET_A_DONATION_BY_DONATION_ID))
 		{
			ps.setInt(1, donationId);
			ResultSet rs = ps.executeQuery();
//			while(rs.next()) {
//				Donation d = new Donation();
//				d.setUserId(rs.getInt("userId"));
//				d.setTitle(rs.getString("title"));
//				d.setTypeId(rs.getInt("typeId"));
//				d.setCountyId(rs.getInt("countyId"));
//				d.setCityId(rs.getInt("cityId"));
//				d.setQuantity(rs.getInt("quantity"));
//				d.setPicture(rs.getString("picture"));
//				d.setContact(rs.getString("contactInfo"));
//				list.add(d);
//			}
			
			if(rs.next()) {
				d.setDonationId(rs.getInt("donationId"));
				d.setUserId(rs.getInt(rs.getInt("userId")));
				d.setTitle(rs.getString("title"));
				d.setTypeId(rs.getInt("typeId"));
				d.setCountyId(rs.getInt("countyId"));
				d.setCityId(rs.getInt("cityId"));
				d.setQuantity(rs.getInt("quantity"));
				d.setPicture(rs.getString("picture"));
				d.setContact(rs.getString("contactInfo"));
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return d;
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
				d.setDonationId(rs.getInt("donationId"));
				d.setUserId(rs.getInt("userId"));
				d.setTitle(rs.getString("title"));
				d.setTypeId(rs.getInt("typeId"));
				d.setCountyId(rs.getInt("countyId"));
				d.setCityId(rs.getInt("cityId"));
				d.setQuantity(rs.getInt("quantity"));
				d.setPicture(rs.getString("picture"));
				d.setContact(rs.getString("contactInfo"));
				list.add(d);
				
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}	
	
	public int addDonation(Donation donation) throws ClassNotFoundException {
		String INSERT_DONATIONS_SQL = "INSERT INTO donation" + "(userId, title, typeId, countyId, cityId, quantity, picture, contactInfo) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

		int result = 0;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(INSERT_DONATIONS_SQL)) {

			ps.setInt(1, donation.getUserId());
			ps.setString(2, donation.getTitle());
			ps.setInt(3, donation.getTypeId());
			ps.setInt(4, donation.getCountyId());
			ps.setInt(5, donation.getCityId());
			ps.setInt(6, donation.getQuantity());
			ps.setString(7, donation.getPicture());
			ps.setString(8, donation.getContact());

			result = ps.executeUpdate();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void deleteDonation(int donationId) throws ClassNotFoundException {
		String DELETE_DONATION = "DELETE FROM donation where donationId = ?";
		
		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(DELETE_DONATION)) {

			ps.setInt(1, donationId);
			ps.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateDonation(int donationId, String title, int typeId, int countyId, int cityId, int quantity, String picture, String contactInfo) throws ClassNotFoundException
	{
		String UPDATE_DONATION = "UPDATE donation SET title = ?, typeId = ?, countyId = ?, cityId = ?, quantity = ?, picture = ?, contactInfo = ? WHERE donationId = ?";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

				PreparedStatement ps = connection.prepareStatement(UPDATE_DONATION)) {

			ps.setString(1, title);
			ps.setInt(2, typeId);
			ps.setInt(3, countyId);
			ps.setInt(4, cityId);
			ps.setInt(5, quantity);
			ps.setString(6, picture);
			ps.setString(7, contactInfo);
			ps.setInt(8, donationId);
			ps.execute();
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
