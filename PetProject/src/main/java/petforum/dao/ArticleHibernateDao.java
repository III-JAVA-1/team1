package petforum.dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import Gusty.model.MemberBean;
import petforum.model.ArticleBean;
import util.HibernateUtils;

@Repository
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
	public MemberBean getMember(int U_Id) {
		
		MemberBean memberBean =null;
		Session session = factory.getCurrentSession();
		memberBean = session.get(MemberBean.class, U_Id);
		return memberBean;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<MemberBean> getAllMembers(String hql) {
		
		List<MemberBean> list = new ArrayList<MemberBean>();
		
		Session session = factory.getCurrentSession();	
		Query<MemberBean> query = session.createQuery(hql);		
		list = query.getResultList();
		
		return list;
	}


}
