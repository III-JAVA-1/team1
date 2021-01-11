package com.web.pet.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.web.pet.admin.controller.adminCURD;
import com.web.pet.admin.dao.AdminDao;
import com.web.pet.member.model.Member;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.petshop.model.PetshopBean;

@EnableTransactionManagement
@Transactional
@Service
public class AdminService {

	@Autowired
	private AdminDao adaminDao;
	
	public List<Member> membernamesearch() {//admin member依名字查詢

		return adaminDao.membernamesearchDao();
	}
	
	public Integer updateauthorityService(Integer user_id) {//admin member更改權限

		return adaminDao.updateauthorityDao(user_id);
	}
	
	//////////////////////////////會員管理////////////////////////////////////
	
	public  List<Object[]> storetop10(Integer month) {//商品銷售Top10
		return adaminDao.storetop10(month);
	}
	
	public  List<Object[]> allsales(Integer month) {//銷售總金額
		return adaminDao.allsales(month);
	}
	
	//////////////////////////////商城管理////////////////////////////////////
	
	public  List<Object[]> activehottimeService(Integer month) {//活動顯示時間熱度
		return adaminDao.activehottimeDao(month);
	}
	
	public  List<Object[]> activejointop3Service() {//活動顯示參加人數top3
		return adaminDao.activejointop3Dao();
	}
	
	public  List<Object[]> activetypeService() {//活動顯示類型比例
		return adaminDao.activetypeDao();
	}
	
	public List<Object[]> activeallService(){//活動顯示全部活動
		return adaminDao.activeallDao();
	}
	
	public List<Object[]> activejoinallService(Integer aid){//活動顯示全部活動的參加人數
		return adaminDao.activejoinallDao(aid);
	}
	
	public List<Object[]> activecheckService(){//活動顯示要審核的活動
		return adaminDao.activecheckDao();
	}
	
	public Integer activeokService(Integer aid) {//顯示審核通過活動
		return adaminDao.activeokDao(aid);
	}
	
	public Integer activedeleteService(Integer aid) {//不予許活動通過
		return adaminDao.activedeleteDao(aid);
	}

	//////////////////////////////活動管理////////////////////////////////////
	
	public List<Object[]> articlehotService(Integer month){//文章顯示本月發文熱度
		return adaminDao.articlehotDao(month);
	}
	
	public List<Object[]> articletop3Service(Integer month){//文章顯示本月文章點閱率top3
		return adaminDao.articletop3Dao(month);
	}
	
	public List<Object[]> articletypeService(){//文章顯示子版比例
		return adaminDao.articletypeDao();
	}
	
	public List<Object[]> articlefullService(){//文章總覽分頁和搜尋
		return adaminDao.articlefullDao();
	}
	
	public List<Object[]> articledetailService(Integer aid){//文章詳細內容
		return adaminDao.articledetailDao(aid);
	}
	
	public List<Object[]> articlecommentService(Integer aid){//文章留言內容
		return adaminDao.articlecommentDao(aid);
	}
	
	public Integer articlecommentdeleteService(Integer cid){//文章留言內容刪除
		return adaminDao.articlecommentdelteDao(cid);
	}
	
	public Integer articledeleteService(Integer aid){//文章內容+留言+喜愛刪除
		return adaminDao.articledelteDao(aid);
	}
	
	//////////////////////////////文章管理////////////////////////////////////
	
	public List<Object[]> petshophotService(Integer month){//店家預約熱度
		return adaminDao.petshophotDao(month);
	}
	
	public List<Object[]> petshoptop3Service(){//店家預約top3
		return adaminDao.petshoptop3Dao();
	}
	
	public void addnewstoreService(PetshopBean petshopBean){//新增店家
		adaminDao.addnewstoreDao(petshopBean);
	}
	
	public List<Object[]> editshopSevice(Integer id) {//修改店家秀出資料
		return adaminDao.editshopDao(id);
	}
	
	public PetshopBean originpetshopService(Integer id) {//取得一筆店家物件
		return adaminDao.originpetshopDao(id);
	}
	
	public Integer editpetshopgoService(PetshopBean petshopBean) {//店家修改資料確認送出
		return adaminDao.editpetshopgoDao(petshopBean);
	}
	
	public List<Object[]> petshopallService(String search,Integer page){//顯示全部店家
		return adaminDao.petshopallDao(search,page);
	}
	
	public Integer petshopdeleteService(Integer sid){//刪除店家
		return adaminDao.petshopdeleteDao(sid);
	}
	
	//////////////////////////////店家管理////////////////////////////////////
	
	public List<Object[]> allmomService(){//顯示全部保母
		return adaminDao.allmomDao();
	}
	
	public Mom getfullmomService(Integer mid) {//取得一筆保母物件
		return adaminDao.getfullmomDao(mid);
	}
	
	public Integer deletemomService(Integer mid){//刪除保母
		return adaminDao.deletemomDao(mid);
	}
	
	//////////////////////////////保母管理////////////////////////////////////
}
