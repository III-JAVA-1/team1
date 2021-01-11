package com.web.pet.mom.dao.impl;


import com.web.pet.member.model.Member;
import com.web.pet.mom.Exeption.MomSearchNotFoundException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.req.MomData;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
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
        mom.setMember(session.get(Member.class, uId));
        session.save(mom);
    }

    @Override
    public Mom getMomByMemberId(int userId) {
        return getMomByMomId(userId);
    }

    @Override
    public Mom getMomByMomId(int momId) {
        return sessionFactory.getCurrentSession().get(Mom.class, momId);
    }

    @SneakyThrows
    @Override
    public List<MomData> getAllMoms(String country, String title) {
        if (country == null) {
            country = "";
        }
        if (title == null) {
            title = "";
        }
        String sql = "select Member.country , MOM.title , Member.sname \n" +
                ",Mom.bodyType1,Mom.bodyType2,Mom.bodyType3,Mom.bodyType4\n" +
                ",Mom.notices,Mom.proPrice1,Mom.proPrice2,Mom.proPrice3\n" +
                ",Mom.momId,Member.Img\n" +
                "from Member,MOM\n" +
                "where MOM.momId=Member.u_Id\n" +
                "and Member.country like '%" + country + "%'" +
                "and MOM.title like '%" + title + "%'";

        Session session = sessionFactory.getCurrentSession();
        List<Object[]> resultList = session.createNativeQuery(sql).getResultList();

        List<MomData> list = new LinkedList<>();
        for (Object[] objects : resultList) {
            list.add(MomData.mappingMomData(objects));
        }
        if (list.isEmpty()) {
            throw new MomSearchNotFoundException();
        } else {
            return list;
        }

    }

    @Override
    public Mom showPic(Integer momId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Mom.class, momId);
    }

    @SneakyThrows
    @Override
    public List<MomData> getReservation(Integer momId) {

        String sql = "select Member.country , MOM.title , Member.sname ,Mom.bodyType1\n" +
                ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4\n" +
                ",Mom.notices,Mom.proPrice1,Mom.proPrice2,Mom.proPrice3,Mom.pic\n" +
                ",Mom.momId,Member.Address,Member.District,\n" +
                "Member.Img,Member.Phone,Mom.Experience,Mom.petContent\n" +
                "from Member,MOM\n" +
                "where Member.u_Id =" + momId +
                "AND MOM.momId =" + momId;

        Session currentSession = sessionFactory.getCurrentSession();
        List<Object[]> result = currentSession.createNativeQuery(sql).getResultList();
        List<MomData> list = new LinkedList<>();
        for (Object[] objects : result) {
            list.add(MomData.mappingOrderData(objects));
        }
        return list;
    }
}
