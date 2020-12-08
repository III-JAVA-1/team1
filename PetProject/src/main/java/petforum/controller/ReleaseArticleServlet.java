package petforum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petforum.model.ArticleBean;
import petforum.service.ArticleService;


@WebServlet("/ReleaseArticleServlet")
public class ReleaseArticleServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); 
		
		int poster_uid;
		String article_name = null;
		String forum_id = null;
		String article_content = null;
		String updated_time = null;
		int reply = 0;
		int viewing=0;
		int isHide = 0;
		//int member_id = Integer.parseInt(request.getSession(true).getAttribute("user").toString());//從session拿到
		int member_id = 1;
		
		if(request.getParameter("preview").toString().equals("確定修改"))
		{
			poster_uid = Integer.parseInt(request.getParameter("poster_uid").toString().trim());
			article_name=request.getParameter("header").trim();
			forum_id=request.getParameter("selForumId").trim();
			article_content=request.getParameter("content").trim();
			updated_time=request.getParameter("updatedTime").trim();
				
			PrintWriter out = response.getWriter();
			
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			String tsStr = updated_time;//	將字串轉換成TimeStamp型態
			try {
			ts = Timestamp.valueOf(tsStr);
			System.out.println(ts);
			} catch (Exception e) {
			e.printStackTrace();
			} 
			System.out.println(poster_uid);
			System.out.println(forum_id);
			System.out.println(article_name);
			System.out.println(article_content);
			System.out.println(ts);
			System.out.println(reply);
			System.out.println(isHide);
			System.out.println(viewing);
			
			
			ArticleBean articleBean = new ArticleBean(poster_uid,forum_id,article_name,ts,article_content,member_id);
			request.getSession(true).setAttribute("ArticleBean",articleBean);

			////////////////////////////////////////////////////////
			ArticleService service = new ArticleService();
			int count = service.saveOrUpdateArticle(articleBean);	
			////////////////////////////////////////////////////////
			
			if(count > 0) {
			request.getSession(true).removeAttribute("ArticleBean");
			out.print("<script>");
			out.print("window.alert('文章修改成功');  window.location.href='/PetProject/petforum/postDetail.jsp?posterUid="+poster_uid+"'");
			out.print("</script>");
			}
			
		}
		if(request.getParameter("preview").toString().equals("新增"))
		{
			//poster_uid = Integer.parseInt(request.getParameter("poster_uid").toString());
			article_name=request.getParameter("header").trim();
			forum_id=request.getParameter("selForumId").trim();
			article_content=request.getParameter("content").trim();
			updated_time=request.getParameter("updatedTime").trim();
				
			PrintWriter out = response.getWriter();
			
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			String tsStr = updated_time;//	將字串轉換成TimeStamp型態
			try {
			ts = Timestamp.valueOf(tsStr);
			System.out.println(ts);
			} catch (Exception e) {
			e.printStackTrace();
			} 
			//System.out.println(poster_uid);
			System.out.println(forum_id);
			System.out.println(article_name);
			System.out.println(article_content);
			System.out.println(ts);
			System.out.println(reply);
			System.out.println(isHide);
			System.out.println(viewing);
			
			
			ArticleBean articleBean = new ArticleBean(forum_id,article_name,ts,article_content,viewing,reply,member_id,isHide);
			request.getSession(true).setAttribute("ArticleBean",articleBean);

			////////////////////////////////////////////////////////
			ArticleService service = new ArticleService();
			int count = service.saveOrUpdateArticle(articleBean);	
			////////////////////////////////////////////////////////
			
			if(count > 0) {
			request.getSession(true).removeAttribute("ArticleBean");
			out.print("<script>");
			out.print("window.alert('文章新增成功');  window.location.href='/PetProject/petforum/lookforPet.jsp'");
			out.print("</script>");
			}
			
			
		}		
		 
	 }	 
 }
	
	 
	 
	
	

	

