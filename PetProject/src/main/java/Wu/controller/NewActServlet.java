package Wu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Wu.model.ActBean;
import Wu.service.ActService;

@WebServlet("/NewActServlet")
public class NewActServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		doGet(request, response);

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		Integer act_no = null;
		String act_name = null;
		Date starttime = null;
		Date endtime = null;
		String act_content = null;
		String act_organize = null;
		String act_orgman = null;
		String act_orgphone = null;
		String act_type = null;

		Integer member_id = null;
//		 Integer.parseInt(request.getParameter("poster_uid").toString())
		act_name = request.getParameter("act_name").trim();

//		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

//		 starttime=request.getParameter("starttime");
//		 endtime=request.getParameter("endtime");
		try {
			starttime = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("starttime")).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		try {
			endtime = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endtime")).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		act_content = request.getParameter("act_content").trim();
		act_organize = request.getParameter("act_organize").trim();
		act_orgman = request.getParameter("act_orgman").trim();
		act_orgphone = request.getParameter("act_orgphone").trim();
		act_type = request.getParameter("act_type");
		
		PrintWriter out = response.getWriter();
		

		System.out.println(act_name);
		System.out.println(starttime);
		System.out.println(endtime);
		System.out.println(act_content);
		System.out.println(act_organize);
		System.out.println(act_orgman);
		System.out.println(act_orgphone);
		System.out.println(act_type);

		ActBean actbean = new ActBean(act_no, act_name, starttime, endtime, act_content, act_organize, act_orgman,
				act_orgphone, act_type);
		request.getSession(true).setAttribute("Actbean", actbean);

		 ActService service = new ActService();
		 int count = service.save(actbean);
		 
		 if(count > 0) {
			 	request.getSession(true).removeAttribute("ActBean");
			 	out.print("<script>");
			 	out.print("window.alert('活動建立成功');  window.location.href='Login.jsp'");
			 	out.print("</script>");
			 	
				}

	}

}
