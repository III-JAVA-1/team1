package petforum.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Gusty.model.MemberBean;
import petforum.dao.ArticleHibernateDao;
import petforum.model.ArticleBean;
import util.HibernateUtils;


public class ArticleService {

	SessionFactory factory = HibernateUtils.getSessionFactory();	
	ArticleHibernateDao dao = new ArticleHibernateDao();
	
	
	public int saveOrUpdateArticle(ArticleBean articleBean) {
		int count =0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			dao.saveOrUpadteArticle(articleBean);
			count++;
			tx.commit();

		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return count;
	}

	
	
	public List<ArticleBean> getAllArticles(String hql) {
		List<ArticleBean> list = new ArrayList<ArticleBean>();		
		
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			list = dao.getAllArticles(hql);
			for(ArticleBean article: list) {
				System.out.println("123"+article.getHeader());
			}
			
			tx.commit();

		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return list;
	}

	

	public ArticleBean getArticle(int posterUid) {
		ArticleBean articleBean =null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			articleBean = dao.getArticle(posterUid);
			
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			
			e.printStackTrace();
		}

		return articleBean;
		
	}



	public int deleteArticle(int posterUid) {
		int count =0;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			dao.deleteArticle(posterUid);
			count++;
			tx.commit();

		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return count;
	}
	
	
	/////////////////////////////////////////////////
	public MemberBean getMember(int U_Id) {
		MemberBean memberBean =null;
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			memberBean = dao.getMember(U_Id);
			
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			
			e.printStackTrace();
		}

		return memberBean;
		
	}
	
	public List<MemberBean> getAllMembers(String hql) {
		List<MemberBean> list = new ArrayList<MemberBean>();		
		
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			list = dao.getAllMembers(hql);
			for(MemberBean member: list) {
				System.out.println("123"+member.getName());
			}
			
			tx.commit();

		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return list;
	}



}
