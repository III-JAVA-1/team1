package com.web.pet.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.pet.member.model.Member;
import com.web.pet.mom.model.Mom;
import com.web.pet.petshop.model.PetshopBean;

@Repository
public class AdminDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Member> membernamesearchDao(){//admin member依名字查詢
		List<Member> list = new ArrayList<Member>();
		Session session = sessionFactory.getCurrentSession();
		Query<Member> query=null;
		String hql = "select u_Id,name,phone,email,sname,zip,country,district,address,gender,birth,authority,password FROM Member where name like '%%'";
		query= session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Integer updateauthorityDao(Integer user_id){//admin member更改權限
		Integer result=0;
		String hql="";
		Session session = sessionFactory.getCurrentSession();
		Member member = session.get(Member.class, user_id);
		if(member.getAuthority()==0) {
			hql = "update Member set authority = 1 where u_Id=:user_id";
		}else {
			hql = "update Member set authority = 0 where u_Id=:user_id";
		}
		result = result + session.createSQLQuery(hql).setParameter("user_id", user_id).executeUpdate();
		return result;
	}
	
	//////////////////////////////會員管理////////////////////////////////////
	
	@SuppressWarnings("unchecked")//商品銷售Top10
	public List<Object[]> storetop10(Integer month){
		List<Object[]> list = new ArrayList<Object[]>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select product_category.category_name,count(order_item.product_id) as '數量'\n"
				+ "from order_item,product,[dbo].[order],product_category\n"
				+ "where month([dbo].[order].date)=:month\n"
				+ "and order_item.product_id = product.product_id\n"
				+ "and order_item.order_id=[dbo].[order].order_id\n"
				+ "and product.category_id=product_category.category_id\n"
				+ "group by product_category.category_name\n"
				+ "order by count(order_item.product_id) desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}


	
	@SuppressWarnings("unchecked")//銷售總金額
	public List<Object[]> allsales (Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select Cast(day([dbo].[order].date)as nvarchar)+'日' as '日期',sum([dbo].[order].cost) as '總金額'\n"
				+ "from [dbo].[order]\n"
				+ "where Month([dbo].[order].date)=:month\n"
				+ "group by day([dbo].[order].date)\n"
				+ "order by day([dbo].[order].date)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	//////////////////////////////商城管理////////////////////////////////////
	
	@SuppressWarnings("unchecked")//活動顯示發起時間熱度圖表
	public List<Object[]> activehottimeDao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select CAST(Day(NewActNow)as nvarchar) +'日' as '日期',count(Day(NewActNow)) as '活動數量'\n"
				+ "from Active2\n"
				+ "where Active2.viableNumber=1\n"
				+ "and Month(NewActNow)=:month\n"
				+ "group by Day(NewActNow)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示參加人數top3
	public List<Object[]> activejointop3Dao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select top 3 Active2.act_name,count(JoinAct.act_no) as '參加人數'\n"
				+ "from Active2,JoinAct\n"
				+ "where JoinAct.act_no=Active2.act_no\n"
				+ "group by JoinAct.act_no,Active2.act_name\n"
				+ "order by count(JoinAct.act_no) desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示類型比例
	public List<Object[]> activetypeDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select act_type,count(act_type) as '數量'\n"
				+ "from Active2\n"
				+ "where Active2.viableNumber=1\n"
				+ "group by act_type";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示全部活動
	public List<Object[]> activeallDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select active2.act_no,active2.act_name,active2.act_content,active2.NewActNow,active2.act_organize,active2.act_orgman,active2.act_orgphone,active2.act_type,active2.act_where,active2.starttime,active2.endtime,sum( case when JoinAct.act_no=Active2.act_no then 1 else 0 end) as '報名人數'\r\n"
				+ "from active2 , JoinAct\r\n"
				+ "where active2.viableNumber=1\r\n"
				+ "and Active2.act_name like '%%'\r\n"
				+ "group by active2.act_no,active2.act_name,active2.act_content,active2.NewActNow,active2.act_organize,active2.act_orgman,active2.act_orgphone,active2.act_type,active2.act_where,active2.starttime,active2.endtime\r\n"
				+ "order by Active2.act_no";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示全部活動的參加人數
	public List<Object[]> activejoinallDao(Integer aid){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select name,email,country,district,address,pettype,petnum,join_actnow,extra,act_name\r\n"
				+ "from JoinAct\r\n"
				+ "where act_no=:aid";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("aid", aid);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//活動顯示要審核的活動
	public List<Object[]> activecheckDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select active2.act_no,active2.act_name,active2.act_content,active2.NewActNow,active2.act_organize,active2.act_orgman,active2.act_orgphone,active2.act_type,active2.act_where,active2.starttime,active2.endtime\r\n"
				+ "from active2\r\n"
				+ "where active2.viableNumber=0\r\n"
				+ "and Active2.act_name like '%%'\r\n"
				+ "group by active2.act_no,active2.act_name,active2.act_content,active2.NewActNow,active2.act_organize,active2.act_orgman,active2.act_orgphone,active2.act_type,active2.act_where,active2.starttime,active2.endtime\r\n"
				+ "order by Active2.act_no";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Integer activeokDao(Integer aid){//審核通過活動
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Active2 \r\n"
				+ "set viableNumber = 1\r\n"
				+ "where act_no=:aid";
		result = session.createSQLQuery(hql).setParameter("aid", aid).executeUpdate();
		return result;
	}
	
	public Integer activedeleteDao(Integer aid) {//不予許活動
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete from Active2 where act_no=:aid";
		result = session.createSQLQuery(hql).setParameter("aid", aid).executeUpdate();
		return result;
	}
	
	//////////////////////////////活動管理////////////////////////////////////
	
	@SuppressWarnings("unchecked")//文章顯示本月發文熱度
	public List<Object[]> articlehotDao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(Day(updatedTime)) as '發文數量',CAST(Day(updatedTime) as nvarchar)+'日' as '日期'\r\n"
				+ "from Article\r\n"
				+ "where Month(updatedTime)=:month\r\n"
				+ "and isHide=0\r\n"
				+ "group by Day(updatedTime)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//文章顯示本月文章點閱率top3
	public List<Object[]> articletop3Dao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select top 3 header,viewing\r\n"
				+ "from Article\r\n"
				+ "where MONTH(updatedTime)=:month\r\n"
				+ "and isHide=0\r\n"
				+ "order by viewing desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//文章顯示子版比例
	public List<Object[]> articletypeDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(forumId) as '子版' ,forumId\r\n"
				+ "from Article\r\n"
				+ "where isHide=0\r\n"
				+ "group by forumId";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//文章總覽分頁和搜尋
	public List<Object[]> articlefullDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select Article.posterUid,Article.header,Article.forumId,Article.viewing,Member.sname,sum( case when Article.posterUid=Comment.posterUid then 1 else 0 end) as '留言數',Article.u_Id,Article.updatedTime\r\n"
				+ "from Article,Comment,Member\r\n"
				+ "where Article.isHide=0\r\n"
				+ "and Article.header like '%%'\r\n"
				+ "and Article.u_Id=Member.u_Id\r\n"
				+ "group by Article.header,Article.forumId,Article.viewing,Article.u_Id,Article.posterUid,Member.sname,Article.updatedTime\r\n"
				+ "order by Article.posterUid\r\n";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//文章詳細內容
	public List<Object[]> articledetailDao(Integer aid){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select header,content\r\n"
				+ "from Article\r\n"
				+ "where Article.posterUid=:aid";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("aid", aid);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//文章留言內容
	public List<Object[]> articlecommentDao(Integer aid){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select Comment.commentContent,Comment.commentUpdatedtime,Member.sname,Article.header,Comment.commentId\r\n"
				+ "from Comment,Member,Article\r\n"
				+ "where Comment.posterUid=:aid\r\n"
				+ "and Member.u_Id=Comment.u_Id\r\n"
				+ "and Comment.posterUid=Article.posterUid";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("aid", aid);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Integer articlecommentdelteDao(Integer cid){//文章留言內容刪除
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete \r\n"
				+ "from Comment\r\n"
				+ "where commentId=:cid";
		result = session.createSQLQuery(hql).setParameter("cid", cid).executeUpdate();
		return result;
	}
	
	public Integer articledelteDao(Integer aid){//文章內容+留言+喜愛刪除
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete \r\n"
				+ "from Comment\r\n"
				+ "where Comment.posterUid=:aid";
		String hql2="delete \r\n"
				+ "from ArticleFavorite\r\n"
				+ "where posterUid=:aid";
		String hql3="delete \r\n"
				+ "from Article\r\n"
				+ "where Article.posterUid=:aid";
		result = result+session.createSQLQuery(hql).setParameter("aid", aid).executeUpdate();
		result = result+session.createSQLQuery(hql2).setParameter("aid", aid).executeUpdate();
		result = result+session.createSQLQuery(hql3).setParameter("aid", aid).executeUpdate();
		return result;
	}
	
	//////////////////////////////文章管理////////////////////////////////////
	
	@SuppressWarnings("unchecked")//店家預約熱度
	public List<Object[]> petshophotDao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(day(thistime)) as '訂單數量',cast(day(thistime) as nvarchar)+'日' as '訂單日期'\r\n"
				+ "from Salon_reserv\r\n"
				+ "where Month(thistime)=:month\r\n"
				+ "group by day(thistime)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//店家預約top3
	public List<Object[]> petshoptop3Dao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select top 3 storename , count(storename) as '訂單數量'\r\n"
				+ "from Salon_reserv\r\n"
				+ "group by storename\r\n"
				+ "order by count(storename) desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public void addnewstoreDao(PetshopBean petshopBean){//新增店家
		Session session = sessionFactory.getCurrentSession();
		session.save(petshopBean);
	}
	
	@SuppressWarnings("unchecked")//修改店家秀出資料
	public List<Object[]> editshopDao(Integer id){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select id,name,address,phone,type,pet,image\n"
				+ "from petshop\n"
				+ "where id=:id";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("id", id);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public PetshopBean originpetshopDao(Integer id) {//取得一筆店家物件
		Session session = sessionFactory.getCurrentSession();
		return session.get(PetshopBean.class, id);
	}
	
	public Integer editpetshopgoDao(PetshopBean petshopBean) {//店家修改資料送出
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		session.merge(petshopBean);
		result++;
		return result;
	}
	
	@SuppressWarnings("unchecked")//顯示全部店家
	public List<Object[]> petshopallDao(String search,Integer page){
		int start=0,end=10000;
		if(page==null) {start=0;end=10000;}
		else {start=page*12-12;end=12;}
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select id,name,address,phone,type,pet,image\n"
				+ "from Petshop \n"
				+ "where name like '%"+search+"%'\n"
				+ "order by id\n"
				+ "offset :start rows\n"
				+ "FETCH NEXT :end ROWS ONLY";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("start", start).setParameter("end", end);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Integer petshopdeleteDao(Integer sid){//刪除店家
		Integer reusult=0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete from Petshop where id = :sid";
		reusult = session.createSQLQuery(hql).setParameter("sid", sid).executeUpdate();
		return reusult;
	}
	
	//////////////////////////////店家管理////////////////////////////////////
	
	@SuppressWarnings("unchecked")//顯示全部保母
	public List<Object[]> allmomDao(){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select momId,title,experience,notices,petContent,proPrice1,proPrice2,proPrice3,bodyType1,bodyType2,bodyType3,bodyType4,uId\n"
				+ "from mom";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Mom getfullmomDao(Integer mid) {//取得一筆保母物件
		Session session = sessionFactory.getCurrentSession();
		Mom mom = session.get(Mom.class, mid);
		return mom;
	}
	
	@SuppressWarnings("unchecked")//顯示保母詳細資料注意和內容
	public List<Object[]> momdetailDao(Integer mid){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select title,notices,petContent from Mom where momId=:mid";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("mid", mid);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	public Integer deletemomDao(Integer mid){//刪除保母
		Integer result=0;
		Session session = sessionFactory.getCurrentSession();
		String hql1 = "delete favoriteMom where momId=:mid";
		String hql2 = "delete PetMomOrderComment where momId=:mid";
		String hql3 = "delete PetMomOrder where momId=:mid";
		String hql4 = "delete mom where momId=:mid";
		result = result + session.createSQLQuery(hql1).setParameter("mid", mid).executeUpdate();
		result = result + session.createSQLQuery(hql2).setParameter("mid", mid).executeUpdate();
		result = result + session.createSQLQuery(hql3).setParameter("mid", mid).executeUpdate();
		result = result + session.createSQLQuery(hql4).setParameter("mid", mid).executeUpdate();
		return result;
	}
	
	@SuppressWarnings("unchecked")//本月保母預約熱度
	public List<Object[]> momhottimeDao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cast(day(orderCreate)as nvarchar)+'日' as'日期',count(day(orderCreate)) as'訂單數量'\n"
				+ "from PetMomOrder\n"
				+ "where month(orderCreate)=:month\n"
				+ "group by day(orderCreate)";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//顯示保母評價
	public List<Object[]> mommessageDao(Integer mid){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select Mom.title,PetMomOrderComment.comment,PetMomOrderComment.commentNowTime,PetMomOrderComment.star,Member.sname,PetMomOrderComment.commentId\r\n"
				+ "from PetMomOrderComment,Member,Mom\r\n"
				+ "where PetMomOrderComment.momId=:mid\r\n"
				+ "and PetMomOrderComment.uId=Member.u_Id\r\n"
				+ "and PetMomOrderComment.momId=Mom.momId";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("mid", mid);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	@SuppressWarnings("unchecked")//顯示保母接單top3
	public List<Object[]> momordertop3Dao(Integer month){
		List<Object[]> list = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
		String hql = "select Top 3 Mom.title,count(PetMomOrder.momId)as '訂單數量' \r\n"
				+ "from PetMomOrder,Mom\r\n"
				+ "where Mom.momId=PetMomOrder.momId\r\n"
				+ "and MONTH(PetMomOrder.orderCreate)=:month\r\n"
				+ "group by Mom.title,PetMomOrder.momId\r\n"
				+ "order by count(PetMomOrder.momId) desc";
		Query<Object[]> query=null;
		query = session.createSQLQuery(hql).setParameter("month", month);
		list=query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	//////////////////////////////保母管理////////////////////////////////////
	
}
