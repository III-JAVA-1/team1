package com.web.pet.mom.service;

import com.web.pet.mom.dao.OrderCommentDAO;
import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.OrderComment;
import com.web.pet.mom.model.OrderCommentReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author i19
 */
@Service
@Transactional
public class OrderCommentService {

	private final PetMomDAO petMomDAO;

	private final OrderCommentDAO orderCommentDAO;

	private final PetMomOrderDAO petMomOrderDAO;

	@Autowired
	public OrderCommentService(PetMomDAO petMomDAO, OrderCommentDAO orderCommentDAO, PetMomOrderDAO petMomOrderDAO) {
		this.petMomDAO = petMomDAO;
		this.orderCommentDAO = orderCommentDAO;
		this.petMomOrderDAO = petMomOrderDAO;
	}

	public void comment(OrderCommentReq req ) {
		OrderComment orderComment = new OrderComment();

		orderComment.setComment(req.getComment());
		orderComment.setPetMomOrder(petMomOrderDAO.getOrderById(req.getListId()));
		orderComment.setMom(petMomDAO.getMomByMomId(req.getUserId()));
		orderCommentDAO.insertOrderComment(orderComment);
	}

	public List<OrderComment> searchComment(int uId){
		return orderCommentDAO.searchOrderComment(uId);
	}

	public int updateOrderComment(OrderComment orderComment) {
		return orderCommentDAO.updateOrderComment(orderComment);
	}

	public int deleteOrderComment(OrderComment orderComment) {
		return orderCommentDAO.deleteOrderComment(orderComment);
	}

}
