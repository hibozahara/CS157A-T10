package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RequestDao;
import model.Request;

import dao.UserDao;
import model.User;

import dao.DonationDAO;
import model.Donation;

/**
 * Servlet implementation class RequestServlet
 */
//@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RequestDao requestDao = new RequestDao();
	private DonationDAO donationDao = new DonationDAO();
	private UserDao userDao = new UserDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RequestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String donationUserId = request.getParameter("donationUserId");
		String destPage = "postings.jsp";

		try {
			int currentUserId = userDao.getUserIdByEmail(email);
			int donatorId = Integer.parseInt(donationUserId);

			if (currentUserId == 0) {
				String message = "Current user's Id could not be found";
				request.setAttribute("message", message);
			} else if (donatorId == 0) {
				String message = "Donator's Id could not be found";
				request.setAttribute("message", message);
			}
			int donationId = donationDao.getDonationById(donatorId);

			int result = requestDao.addRequest(currentUserId, donationId);

			if (result == 0) {
				String message = "Could not add into Request Table";
				request.setAttribute("message", message);
			}

		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}

		response.sendRedirect(destPage);
	}

}
