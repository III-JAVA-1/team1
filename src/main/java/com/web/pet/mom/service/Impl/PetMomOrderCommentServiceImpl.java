package com.web.pet.mom.service.Impl;

import com.web.pet.mom.dao.PetMomDAO;
import com.web.pet.mom.dao.PetMomOrderCommentDAO;
import com.web.pet.mom.dao.PetMomOrderDAO;
import com.web.pet.mom.model.PetMomOrderComment;
import com.web.pet.mom.model.req.OrderCommentReq;
import com.web.pet.mom.service.PetMomOrderCommentService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
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

	private final PetMomOrderDAO petMomOrderDAO;



	@Override
	public void insertComment(OrderCommentReq req) {
		PetMomOrderComment petMomOrderComment = new PetMomOrderComment();

		petMomOrderComment.setComment(req.getComment());
		petMomOrderComment.setPetMomOrder(petMomOrderDAO.getOrderById(req.getOrderId()));
		petMomOrderComment.setMom(petMomDAO.getMomByMomId(req.getUserId()));
		petMomOrderCommentDAO.insertOrderComment(petMomOrderComment);
	}

	@Override
	public List<PetMomOrderComment> searchComment(int uId){
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