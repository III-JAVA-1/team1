package i19.controller;

import i19.model.MomBean;
import i19.service.MomService;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MomServlet
 */
@WebServlet(description = "fang", urlPatterns = { "/MomRegisterServlet" })
public class MomServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public MomServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		// To prevent caching
		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server

		if (request.getParameter("submit") != null) {
			goToSubmitProcess(request, response);
		}
	}

	public void goToSubmitProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String petContent = "null";
        String experience = "null";
        String notices = "null";
        String pic = "null";
        String title;
        int proPrice1 = 0;
        int proPrice2 = 0;
        int proPrice3 = 0;
        int proPrice4 = 0;

        String bodyType1 = "null";
        String bodyType2 = "null";
        String bodyType3 = "null";
        String bodyType4 = "null";
        String bodyType5 = "null";

        int userUID;

        title = request.getParameter("title").trim();

        if (request.getParameter("petContent") == null || request.getParameter("petContent") == "") {
            petContent = "null";
        } else {
            petContent = request.getParameter("petContent");
        }
        // petContent = request.getParameter("petContent");
        if (request.getParameter("experience") == null || request.getParameter("experience") == "") {
            experience = "null";
        } else {
            experience = request.getParameter("experience");
        }
        // experience = request.getParameter("experience");
        if (request.getParameter("notices") == null || request.getParameter("notices") == "") {
            notices = "null";
        } else {
            notices = request.getParameter("notices");
        }
        // notices = request.getParameter("notices");
        if (request.getParameter("pic") == null || request.getParameter("pic") == "") {
            pic = "null";
        } else {
            pic = request.getParameter("pic");
        }
        // pic = request.getParameter("pic");

        // proPrice1 = Integer.parseInt(request.getParameter("proPrice1").toString());
        // proPrice2 = Integer.parseInt(request.getParameter("proPrice2").toString());
        // proPrice3 = Integer.parseInt(request.getParameter("proPrice3").toString());
        // proPrice4 = Integer.parseInt(request.getParameter("proPrice4").toString());
        if (request.getParameter("proPrice1") == null || request.getParameter("proPrice1") == "") {
            proPrice1 = 0;
        } else {
            proPrice1 = Integer.parseInt(request.getParameter("proPrice1").toString());
        }

        if (request.getParameter("proPrice2") == null || request.getParameter("proPrice2") == "") {
            proPrice2 = 0;
        } else {
            proPrice2 = Integer.parseInt(request.getParameter("proPrice2").toString());
        }

        if (request.getParameter("proPrice3") == null || request.getParameter("proPrice3") == "") {
            proPrice3 = 0;
        } else {
            proPrice3 = Integer.parseInt(request.getParameter("proPrice3").toString());
        }

        if (request.getParameter("proPrice4") == null || request.getParameter("proPrice4") == "") {
            proPrice4 = 0;
        } else {
            proPrice4 = Integer.parseInt(request.getParameter("proPrice4").toString());
        }

        if (request.getParameter("bodyType1") == null || request.getParameter("bodyType1") == "") {
            bodyType1 = "null";
        } else {
            bodyType1 = request.getParameter("bodyType1").trim();
        }
        // bodyType1 = request.getParameter("bodyType1").trim();

        if (request.getParameter("bodyType2") == null || request.getParameter("bodyType2") == "") {
            bodyType2 = "null";
        } else {
            bodyType2 = request.getParameter("bodyType2").trim();
        }
        // bodyType2 = request.getParameter("bodyType2").trim();

        if (request.getParameter("bodyType3") == null || request.getParameter("bodyType3") == "") {
            bodyType3 = "null";
        } else {
            bodyType3 = request.getParameter("bodyType3").trim();
        }
        // bodyType3 = request.getParameter("bodyType3").trim();
        if (request.getParameter("bodyType4") == null || request.getParameter("bodyType4") == "") {
            bodyType4 = "null";
        } else {
            bodyType4 = request.getParameter("bodyType4").trim();
        }
        // bodyType4 = request.getParameter("bodyType4").trim();
        if (request.getParameter("bodyType5") == null || request.getParameter("bodyType5") == "") {
            bodyType5 = "null";
        } else {
            bodyType5 = request.getParameter("bodyType5").trim();
        }
        // bodyType5 = request.getParameter("bodyType5").trim();

        userUID = Integer.parseInt(request.getSession().getAttribute("user").toString());

        MomBean mb = new MomBean(petContent, experience, notices, title, pic, proPrice1, proPrice2, proPrice3, proPrice4, bodyType1, bodyType2, bodyType3, bodyType4, bodyType5, memberBean);
        request.getSession(true).setAttribute("reg_Mom", userUID);

        MomService ms = new MomService();

        if (ms.save(mb, userUID) > 0) {
            request.getSession(true).removeAttribute("reg_Mom");
            out.print("<script>");
            out.print("window.alert('登入成功'); window.location.href='zseqw123/extar.jsp';");
            out.print("</script>");
        } else {
            out.print("<script>");
            out.print("window.alert('登入失敗'); window.location.href='zseqw123/extar.jsp';");
            out.print("</script>");
        }
    }
}
