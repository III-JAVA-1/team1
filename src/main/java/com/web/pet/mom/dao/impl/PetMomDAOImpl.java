package com.web.pet.mom.dao.impl;


import com.web.pet.member.model.Member;
import com.web.pet.mom.Exeption.MomSearchNotFoundException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.model.req.MomData;
import com.web.pet.mom.model.res.MomDataRes;
import com.web.pet.mom.model.res.PageableMomDataRes;
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
    public PageableMomDataRes getAllMoms(String country, String title, Integer currPage, Integer pageSize) {

        if (country == null) {
            country = "";
        }
        if (title == null) {
            title = "";
        }
        String sql = "select Member.country , MOM.title , Member.sname \n" +
                ",Mom.bodyType1,Mom.bodyType2,Mom.bodyType3,Mom.bodyType4\n" +
                ",Mom.notices,Mom.proPrice1,Mom.proPrice2,Mom.proPrice3\n" +
                ",Mom.momId,Member.Img,Member.District,Member.address\n" +
                "from Member,MOM\n" +
                "where MOM.momId=Member.u_Id\n" +
//                "and Member.country = '"+country+"'\n" +
//                "and MOM.title = '"+title+"'";
                "and Member.country like '%" + country + "%'" +
                "and MOM.title like '%" + title + "%'";

        Session session = sessionFactory.getCurrentSession();

        List<Object[]> resultList = session.createNativeQuery(sql)
                .setFirstResult((currPage - 1) * pageSize)
                .setMaxResults(pageSize)
                .getResultList();

        String countSql = "SELECT COUNT(momId) count FROM Mom,Member\n" +
                "where MOM.momId=Member.u_Id";

        Integer totalDataSize = (Integer) session.createNativeQuery(countSql).uniqueResult();

        List<MomData> list = new LinkedList<>();
        for (Object[] objects : resultList) {
            list.add(MomData.mappingMomData(objects));
        }

//語法糖        list.forEach(this::getMomStar);

        for (MomData momData : list) {
            getMomStar(momData);
        }

        if (list.isEmpty()) {
            throw new MomSearchNotFoundException();
        } else {
            return PageableMomDataRes.builder().
                    currPage(currPage).
                    pageSize(pageSize).
                    totalDataSize(totalDataSize).momDataList(list).build();
        }
    }

    private void getMomStar(MomData momData) {
        String sqlGetStar = "SELECT AVG(petMomOrderComment.star) starAVG, COUNT(petMomOrderComment.commentId) countTime\n" +
                "FROM PetMomOrderComment petMomOrderComment , Mom mom \n" +
                "where MOM.momId= petMomOrderComment.momId\n" +
                "AND mom.momId =" + momData.getMomId();

        Session session = sessionFactory.getCurrentSession();

        Object[] result = (Object[]) session.createNativeQuery(sqlGetStar).uniqueResult();
        momData.setStarAvg((Integer) result[0]);
        momData.setCountTime((Integer) result[1]);
    }

    @Override
    public Mom showPic(Integer momId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Mom.class, momId);
    }

    @SneakyThrows
    @Override
    public MomDataRes getReservation(Integer momId) {

        //detailObject
        String sql = "select Member.country , MOM.title , Member.sname ,Mom.bodyType1\n" +
                ",Mom.bodyType2,Mom.bodyType3,Mom.bodyType4\n" +
                ",Mom.notices,Mom.proPrice1,Mom.proPrice2,Mom.proPrice3,Mom.pic\n" +
                ",Mom.momId,Member.Address,Member.District,\n" +
                "Member.Img,Member.Phone,Mom.Experience,Mom.petContent\n" +
                "from Member,MOM\n" +
                "where Member.u_Id =" + momId +
                "AND MOM.momId =" + momId;

        //評論list
        String sqlComment = "SELECT petMomOrderComment.comment\n" +
                ",petMomOrderComment.commentNowTime,petMomOrderComment.star ,member.sname\n" +
                "FROM Member member , PetMomOrderComment petMomOrderComment, Mom mom\n" +
                "WHERE member.u_Id = petMomOrderComment.uId\n" +
                "AND petMomOrderComment.momId = " + momId +
                "AND mom.momId =" + momId;

        Session session = sessionFactory.getCurrentSession();
        List<Object[]> resultList = session.createNativeQuery(sqlComment).getResultList();

        List<MomData> list = new LinkedList<>();
        for (Object[] objects : resultList) {
            list.add(MomData.mappingCommentData(objects));
        }

        Session currentSession = sessionFactory.getCurrentSession();
        Object result = currentSession.createNativeQuery(sql).uniqueResult();
        MomData momData = MomData.mappingOrderData((Object[]) result);
        return MomDataRes.builder()
                .momDetailData(momData)
                .commentDataList(list).build();
    }

//    @Override
//    public List<MomData> getCommentData(Integer momId) {
//
//        String sqlComment = "SELECT petMomOrderComment.comment\n" +
//                ",petMomOrderComment.commentNowTime,petMomOrderComment.star ,member.sname\n" +
//                "FROM Member member , PetMomOrderComment petMomOrderComment, Mom mom\n" +
//                "WHERE member.u_Id = petMomOrderComment.uId\n" +
//                "AND petMomOrderComment.momId = " + momId +
//                "AND mom.momId =" + momId;
//
//        Session session = sessionFactory.getCurrentSession();
//        List<Object[]> resultList = session.createNativeQuery(sqlComment).getResultList();
//
//        List<MomData> list = new LinkedList<>();
//        for (Object[] objects : resultList) {
//            list.add(MomData.mappingCommentData(objects));
//        }
//
//        return list;
//    }
}
