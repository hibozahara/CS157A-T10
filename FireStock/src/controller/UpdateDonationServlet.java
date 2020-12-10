package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RequestDao;

/**
 * Servlet implementation class UpdateDonationServlet
 */
//@WebServlet("/UpdateDonationServlet")
public class UpdateDonationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RequestDao requestDao = new RequestDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDonationServlet() {
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
		String accept = request.getParameter("Accept");
		System.out.println(accept);
		String decline = request.getParameter("Decline");
		System.out.println(decline);
		int donationId = Integer.parseInt(request.getParameter("donationId"));
		int requestingUserId = Integer.parseInt(request.getParameter("requestingUserId"));
		String destpage = "mydonations.jsp";
		System.out.println(donationId);
		System.out.println(requestingUserId);
		
		
		if(accept != null) {
			try {
				requestDao.updateRequestToAcceptByDonationId(donationId, requestingUserId);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(decline != null) {
			try {
				System.out.println("request dao");
				requestDao.updateRequestToDeclineByDonationId(donationId, requestingUserId);
			}
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.sendRedirect(destpage);
	}

}
