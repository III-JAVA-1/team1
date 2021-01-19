package com.web.pet.mom.service.Impl;

import com.web.pet.mom.Exeption.CommentIsSameMomException;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.dao.PetMomOrderCommentDAO;
import com.web.pet.mom.model.PetMomOrderComment;
import com.web.pet.mom.model.req.OrderCommentReq;
import com.web.pet.mom.service.PetMomOrderCommentService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author i19
 */
@AllArgsConstructor
@Service
@Transactional(rollbackOn = Exception.class)
public class PetMomOrderCommentServiceImpl implements PetMomOrderCommentService {

    private final PetMomDAO petMomDAO;

    private final PetMomOrderCommentDAO petMomOrderCommentDAO;

    @Override
    public void insertComment(OrderCommentReq req, Integer uId, Integer momId, Integer orderId) {
        if (petMomDAO.getMomByMomId(momId).equals(petMomDAO.getMomByMemberId(uId))) {
            throw new CommentIsSameMomException();
        }else {
            PetMomOrderComment petMomOrderComment = new PetMomOrderComment();
            petMomOrderComment.setComment(req.getComment());
            petMomOrderComment.setStar(req.getStar());
            petMomOrderComment.setCommentNowTime(new Timestamp(System.currentTimeMillis()));

            petMomOrderCommentDAO.insertOrderComment(petMomOrderComment, uId, momId, orderId);
        }
    }

    @Override
    public List<OrderCommentReq> searchComment(int uId) {

        return petMomOrderCommentDAO.searchOrderComment(uId);
    }

    @Override
    public int updateOrderComment(PetMomOrderComment petMomOrderComment) {
        return petMomOrderCommentDAO.updateOrderComment(petMomOrderComment);
    }

    @Override
    public int deleteOrderComment(PetMomOrderComment petMomOrderComment) {
        return petMomOrderCommentDAO.deleteOrderComment(petMomOrderComment);
    }

}
