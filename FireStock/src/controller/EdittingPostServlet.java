package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DonationDAO;
import model.Donation;

/**
 * Servlet implementation class ExistingPostServlet
 */
//@WebServlet("/ExistingPostServlet")
public class EdittingPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DonationDAO donationDao = new DonationDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EdittingPostServlet() {
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
		String edit = request.getParameter("edit");
		String delete = request.getParameter("delete");
		int donationId = Integer.parseInt(request.getParameter("donationId"));
		String destpage = "mydonations.jsp";
		
		
		if(edit != null) {
			//edit in editJsp page with passed donation data
			HttpSession session = request.getSession();
			session.setAttribute("editDonationId", donationId);
			destpage="editDonation.jsp";
		}
		
		else if(delete != null) {
			//delete
			try {
				donationDao.deleteDonation(donationId);
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		response.sendRedirect(destpage);
		
	}

}
