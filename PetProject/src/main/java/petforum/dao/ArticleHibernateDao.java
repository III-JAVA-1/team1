package petforum.dao;


import util.HibernateUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


import petforum.model.ArticleBean;
import petforum.model.MemberBean01;


public class ArticleHibernateDao {
	
	SessionFactory factory = HibernateUtils.getSessionFactory();
	
	public int saveOrUpadteArticle(ArticleBean articleBean) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(articleBean);
		count++;
		return count;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<ArticleBean> getAllArticles(String hql) {
		
		List<ArticleBean> list = new ArrayList<ArticleBean>();
		//hql = "FROM ArticleBean";// 不是表格名稱是類別名稱
		Session session = factory.getCurrentSession();	
		
		 Query<ArticleBean> query = session.createQuery(hql);			   		       
			   
		list = query.getResultList();
		System.out.println("666"+list);
		
		return list;
	}


	public ArticleBean getArticle(int posterUid) {
		
		ArticleBean articleBean =null;
		Session session = factory.getCurrentSession();
		articleBean = session.get(ArticleBean.class, posterUid);
		return articleBean;
	}


	public int deleteArticle(int posterUid) {
		
		int count =0;
		Session session = factory.getCurrentSession();
		ArticleBean articleBean = new ArticleBean();
		articleBean.setPosterUid(posterUid);
		session.delete(articleBean);
		count++;
		return count;
	}
	
	
	///////////////////////////////////////////////////////
	public MemberBean01 getMember(int U_Id) {
		
		MemberBean01 memberBean =null;
		Session session = factory.getCurrentSession();
		memberBean = session.get(MemberBean01.class, U_Id);
		return memberBean;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<MemberBean01> getAllMembers(String hql) {
		
		List<MemberBean01> list = new ArrayList<MemberBean01>();
		
		Session session = factory.getCurrentSession();	
		Query<MemberBean01> query = session.createQuery(hql);		
		list = query.getResultList();
		
		return list;
	}


}
