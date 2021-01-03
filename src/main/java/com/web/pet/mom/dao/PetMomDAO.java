package com.web.pet.mom.dao;


import com.web.pet.member.model.Member;
import com.web.pet.mom.model.Mom;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author i19
 */
@Repository
public class PetMomDAO {

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * 寫入註冊保母資料
     *
     * @param mom
     * @param u_Id
     */
    public void insertMom(Mom mom, Integer u_Id) {
        Session session = sessionFactory.getCurrentSession();
        mom.setMember(session.get(Member.class, u_Id));
        session.save(mom);
    }
    public Mom getMomByMemberId(int userId){
        Member member = sessionFactory.getCurrentSession().get(Member.class, userId);
        return member.getMom();
    }

    public Mom getMomByMomId(int momId){
        return sessionFactory.getCurrentSession().get(Mom.class, momId);
    }

    /**
     * 由城市標題查出的保母資料存在list裡
     *
     * @param country
     * @param title
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Mom> getAllMoms(String country, String title) {
        if (country == null) {
            country = "";
        }
        if (title == null) {
            title = "";
        }
        String sql = "select Member.country , MOM.title , Member.sname ,Mom.bodyType1"
                + ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4,Mom.notices"
                + ",Mom.proPrice1,Mom.proPrice2,Mom.proPrice3,Mom.pic"
                + ",Mom.mom_Id\r\n"
                + "from Member,MOM\r\n"
                + "where MOM.u_Id=Member.u_Id\r\n"
                + "and Member.country like '%" + country + "%'\r\n"
                + "and MOM.title like '%" + title + "%'";

        Session session = sessionFactory.getCurrentSession();

        return (List<Mom>) session.createNativeQuery(sql).getResultList();
    }

    /**
     * 顯示與mom_Id相符的圖片
     *
     * @param mom_Id
     * @return
     */
    public Mom showPic(Integer mom_Id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Mom.class, mom_Id);
    }

    /**
     * 顯示預約時由保母ID查出的保母資料
     *
     * @param mom_Id
     * @return
     */
    public List<Mom> getReservtion(Integer mom_Id) {

        String sql = "select Member.country , MOM.title , Member.sname ,Mom.bodyType1"
                + ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4"
                + ",Mom.proPrice1,Mom.proPrice2,Mom.proPrice3"
                + ",Mom.mom_Id\r\n"
                + "from Member,MOM\r\n"
                + "where Member.u_Id = " +mom_Id
                + "AND MOM.mom_Id = " +mom_Id ;

        Session session = sessionFactory.getCurrentSession();
        return session.createNativeQuery(sql).getResultList();
    }
}
