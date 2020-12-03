package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CityDao;
import dao.CountyDao;
import dao.DonationDAO;
import dao.TypeDao;
import dao.UserDao;

/**
 * Servlet implementation class EditDonationServlet
 */
//@WebServlet("/EditDonationServlet")
public class EditDonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DonationDAO donationDao = new DonationDAO();
	private TypeDao typeDao = new TypeDao();
	private CityDao cityDao = new CityDao();
    private CountyDao countyDao = new CountyDao(); 
    private UserDao userDao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDonationServlet() {
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
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String typeName = request.getParameter("typeName");
		String countyName = request.getParameter("countyName");
		String cityName = request.getParameter("cityName");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String picture = request.getParameter("picture");
		String contactInfo = request.getParameter("contactInfo");
		int donationId = (Integer) session.getAttribute("editDonationId");
		int typeId;
		int cityId;
		int countyId;
		
		String destPage = "mydonations.jsp";
		
		try {
			typeId = typeDao.getTypeIdByName(typeName);
			cityId = cityDao.getCityIdByName(cityName);
			countyId = countyDao.getCountyIdByName(countyName);
			
			donationDao.updateDonation(donationId, title, typeId, countyId, cityId, quantity, picture, contactInfo);
			
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(destPage);
	}

}
