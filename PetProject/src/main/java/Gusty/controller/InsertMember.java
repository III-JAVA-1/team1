package Gusty.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Hibernate;
import org.junit.Ignore;

import Gusty.model.MemberBean;
import Gusty.service.MemberService;
import util.HibernateUtils;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/Gusty/InsertMember")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding(CHARSET_CODE);
	    response.setContentType(CONTENT_TYPE);
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    String name = null;
		String gender = null;
		String password = null;
		String iD = null;
		String phone = null;
		String email = null;
		Date birth = null;
		String sname = null;
		String zipcode = null;
		String county = null;
		String district = null;
		String address = null;
		String img = null;
	    
	    //上傳圖片要用enctype="很長..." 用了request.getPatameter會被搞掉 要想辦法
		
		DiskFileItemFactory factory = new DiskFileItemFactory(); //建立磁碟工廠
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(20*1024*1024);//設定單一圖片大小這是20M
		upload.setSizeMax(40*1024*1024);//設定總檔案大小這是40M
		upload.setHeaderEncoding("UTF-8");	
		if(ServletFileUpload.isMultipartContent(request)) {//form enctype要是那個很長才做
			try {
				List<FileItem> list = upload.parseRequest(request);//接到的參數放進list
				for(FileItem item:list)
				{
					if (item.isFormField()) {//不是圖片檔的表單參數
						String fieldname = item.getFieldName();//表單參數名稱
						String fieldvalue = item.getString("UTF-8");//表單參數值
						System.out.println(fieldname + " : " + fieldvalue);
						if(fieldname.equals("name")) {
							name =fieldvalue.trim();
						}
						else if(fieldname.equals("gender")) {
							gender=fieldvalue.trim();
						}
						else if(fieldname.equals("password")) {
							password=fieldvalue.trim();
						}
						else if(fieldname.equals("iD")) {
							iD=fieldvalue.trim();
						}
						else if(fieldname.equals("phone")) {
							phone=fieldvalue.trim();
						}
						else if(fieldname.equals("email")) {
							email=fieldvalue.trim();
						}
						else if(fieldname.equals("birth")) {			
							try {
								birth=new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(fieldvalue.trim()).getTime());
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}		
						}
						else if(fieldname.equals("sname")) {
							sname=fieldvalue.trim();
						}
						else if(fieldname.equals("zipcode")) {
							zipcode=fieldvalue.trim();
						}
						else if(fieldname.equals("county")) {
							county=fieldvalue.trim();
						}
						else if(fieldname.equals("district")) {
							district=fieldvalue.trim();
						}
						else if(fieldname.equals("address")) {
							address=fieldvalue.trim();
						}	
					} 
					else {
						String fileName = item.getName();
						//File file = new File("D:\\Java EclipseWorkspace\\PetProject\\src\\main\\webapp\\Gusty\\image\\member"+realname,fileName);
						
						File filepath = new File("C:\\AdvancedWebWorkSpace\\PetProject\\src\\main\\webapp\\Gusty\\image\\member\\"+name);
						if(!filepath.exists())//如果資料夾不存在
						{
							filepath.mkdir();//創建資料夾 有時不用有時要用
						}
						
						File file =new File("C:\\AdvancedWebWorkSpace\\PetProject\\src\\main\\webapp\\Gusty\\image\\member\\"+name,fileName);
						
						if(fileName.equals("")||fileName==null){
							img = "No upload file";
						}
						else{
							img="image/member/"+name+"/"+item.getName();
							item.write(file);
						}
					}	
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		//String yourstring = UUID.randomUUID().toString()+"#";
		//產生一個號稱全球唯一的ID，可以保證（概率意義上）3240年不重複
		
		
		HttpSession session = request.getSession();
		MemberService ms = new MemberService();
		
		try {
			MemberBean mb = new MemberBean(name, gender, password, iD, phone, email, birth, sname, zipcode, county, district, address, img);
			session.setAttribute("mb", mb);
			ms.save(mb);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
