package com.web.pet.mom.service;

import com.web.pet.mom.dao.CommentDAO;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.OrderComment;
import com.web.pet.mom.model.OrderCommentReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class OrderCommentService {

	@Autowired
	PetMomDAO petMomDAO;

	@Autowired
    CommentDAO commentDAO;

	@Autowired
	PetMomOrderDAO petMomOrderDAO;

	public void comment(OrderCommentReq req ) {
		OrderComment orderComment = new OrderComment();

		orderComment.setComment(req.getComment());
		orderComment.setPetMomOrder(petMomOrderDAO.getOrderById(req.getListId()));
		orderComment.setMom(petMomDAO.getMomByMomId(req.getUserId()));
		commentDAO.insertRaingDao(orderComment);
	}

	public List<OrderComment> ajaxSearchRaing(int uId){
		return commentDAO.ajaxSearchRaing(uId);
	}

	public int updateRaing(OrderComment orderComment) {
		return commentDAO.updateRaing(orderComment);
	}

	public int deleteRaing(OrderComment orderComment) {
		return commentDAO.deleteRaing(orderComment);
	}

}
