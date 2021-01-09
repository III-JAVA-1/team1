package com.web.pet.mom.dao.impl;


import com.web.pet.member.model.Member;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.MomData;
import lombok.AllArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.LinkedList;
import java.util.List;


/**
 * @author i19
 */
@AllArgsConstructor
@Repository
public class PetMomDAOImpl implements PetMomDAO {

    private final SessionFactory sessionFactory;

    @Override
    public void insertMom(Mom mom, Integer uId) {
        Session session = sessionFactory.getCurrentSession();
//        mom.setMember(session.get(Member.class, uId));
        session.save(mom);
    }

    @Override
    public Mom getMomByMemberId(int userId) {
        Member member = sessionFactory.getCurrentSession().get(Member.class, userId);
//        return member.getMom();
        return getMomByMomId(userId);
    }

    @Override
    public Mom getMomByMomId(int momId) {
        return sessionFactory.getCurrentSession().get(Mom.class, momId);
    }

    @Override
    public List<MomData> getAllMomData(String country, String title) {
        if (country == null) {
            country = "";
        }
        if (title == null) {
            title = "";
        }
        String sql = "select Member.country , MOM.title , Member.sname ,"
                + "Mom.bodyType1"
                + ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4,Mom.notices"
                + ",Mom.proPrice1,Mom.proPrice2,Mom.proPrice3,Mom.pic"
                + ",Mom.momId\r\n"
                + "from Member,MOM\r\n"
                + "where MOM.momId=Member.u_Id\r\n"
                + "and Member.country like '%" + country + "%'\r\n"
                + "and MOM.title like '%" + title + "%'";

        Session session = sessionFactory.getCurrentSession();
        List<Object[]> resultList = session.createNativeQuery(sql).getResultList();

        List<MomData> list = new LinkedList<>();
        for (Object[] objects : resultList) {
            list.add(MomData.mappingMomData(objects));
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }

    }

    @Override
    public List<Mom> getAllMoms(String country, String title) {
        if (country == null) {
            country = "";
        }
        if (title == null) {
            title = "";
        }
        String sql = "select Member.country , MOM.title , Member.sname ,"
                + "Mom.bodyType1"
                + ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4,Mom.notices"
                + ",Mom.proPrice1,Mom.proPrice2,Mom.proPrice3,Mom.pic"
                + ",Mom.momId\r\n"
                + "from Member,MOM\r\n"
                + "where MOM.momId=Member.u_Id\r\n"
                + "and Member.country like '%" + country + "%'\r\n"
                + "and MOM.title like '%" + title + "%'";

        Session session = sessionFactory.getCurrentSession();

        List<Mom> list = session.createNativeQuery(sql).getResultList();


        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }

    }

    @Override
    public Mom showPic(Integer momId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Mom.class, momId);
    }

    @Override
    public List<Mom> getReservation(Integer momId) {

        String sql = "select Member.country , MOM.title , Member.sname ,Mom.bodyType1"
                + ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4"
                + ",Mom.proPrice1,Mom.proPrice2,Mom.proPrice3"
                + ",Mom.momId\r\n"
                + "from Member,MOM\r\n"
                + "where Member.u_Id = " + momId
                + "AND MOM.momId = " + momId;

        Session session = sessionFactory.getCurrentSession();
        return session.createNativeQuery(sql).getResultList();
    }
}
