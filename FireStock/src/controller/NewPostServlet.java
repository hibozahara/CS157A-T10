package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RequestDao;
import model.Request;

import dao.UserDao;
import model.User;

import dao.DonationDAO;
import model.Donation;

import dao.TypeDao;
import dao.CityDao;
import dao.CountyDao;

/**
 * Servlet implementation class NewPostServlet
 */
//@WebServlet("/NewPostServlet")
public class NewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RequestDao requestDao = new RequestDao();
	private DonationDAO donationDao = new DonationDAO();
	private TypeDao typeDao = new TypeDao();
	private CityDao cityDao = new CityDao();
    private CountyDao countyDao = new CountyDao(); 
    private UserDao userDao = new UserDao();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("Here");
		String title = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String typeName = request.getParameter("category");
		String cityName = request.getParameter("city");
		String countyName = request.getParameter("county");
		String picture = request.getParameter("picture");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		int typeId;
		int cityId;
		int countyId;
		
		
		String destPage = "postings.jsp";
		
		try {
			Donation donation = new Donation();
			int userId = userDao.getUserIdByEmail(email);
			typeId = typeDao.getTypeIdByName(typeName);
			
			cityId = cityDao.getCityIdByName(cityName);
			countyId = countyDao.getCountyIdByName(countyName);
			donation.setUserId(userId);
			donation.setTitle(title);
			donation.setTypeId(typeId);
			donation.setCountyId(countyId);
			donation.setCityId(cityId);
			donation.setQuantity(quantity);
			donation.setPicture(picture);
			donation.setContact(contact);
			
			donationDao.addDonation(donation);
		}
		
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(destPage);
	}

}
