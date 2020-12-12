package Henry.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Gusty.model.MemberBean;
import Henry.model.Salon_reservBean;
import Henry.service.Salom_Service;

/**
 
 */
@WebServlet("/Salon_reservServlet")
public class Salon_reservServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	DataSource ds;
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	public void init(ServletConfig config) throws ServletException {
		super.init(config);

//		try {
//			// Create a JNDI Initial context to be able to lookup the DataSource
//			//InitialContext ctx = new InitialContext();
//			// Lookup the DataSource, which will be backed by a pool
//			// that the application server provides.
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/PetDB");
//			if (ds == null)
//				throw new ServletException("Unknown DataSource 'jdbc/PetDB'");
//		} catch (NamingException ex) {
//			ex.printStackTrace();
//		}

//		Connection conn = null;
//		Statement stmt = null;

	}

	public Salon_reservServlet() {
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

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding(CHARSET_CODE);
	    response.setContentType(CONTENT_TYPE);
		String storename;
		String name;
		String phone;
		String address;
		String type;
		String item;
		Timestamp time = null;
		String other;
		MemberBean memberBean=null;
		PrintWriter out = response.getWriter();
		
		
	
			storename=request.getParameter("storename");
			name = request.getParameter("name").trim();
			phone = request.getParameter("phone").trim();
			address = request.getParameter("address").trim();
			type = request.getParameter("type");
			item = request.getParameter("item");
			try {
				time = new Timestamp(
						new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(request.getParameter("time")).getTime());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			other = request.getParameter("other").trim();
			
			System.out.print(storename);
			System.out.println(name);
			System.out.println(phone);
			System.out.println(address);
			System.out.println(type);
			System.out.println(item);
			System.out.println(time);
			System.out.println(other);
			
			Salon_reservBean salon_reservBean = new Salon_reservBean(storename, name, phone, address, type, item, time, other,null);
			request.getSession(true).setAttribute("salon_reservBean", salon_reservBean);
			Salom_Service salom_Service = new Salom_Service();
			if(salom_Service.save(salon_reservBean) > 0) {
				out.print("<script>");
				out.print("window.alert('預約成功'); window.location='Henry/salon_reserv.jsp'");
				out.print("</script>");
				
				
			
		}
	}
}
