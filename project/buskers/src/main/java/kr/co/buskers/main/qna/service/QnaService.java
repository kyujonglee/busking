package kr.co.buskers.main.qna.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;

public interface QnaService {
	public Map<String, Object> list(FreePage freePage);
	public Map<String, Object> sortList(FreePage freePage);
	public Map<String, Object> insertComment(QnaBoardComment qnaBoardComment);
	public Map<String, Object> insertReply(QnaBoardComment qnaBoardComment);
	public Map<String, Object> updateComment(QnaBoardComment qnaBoardComment);
	public Map<String, Object> detail(int boardNo, HttpSession session);
	public Map<String, Object> updateForm(int boardNo);
	public void delete(QnaBoard qnaBoard);
	public void write(QnaBoard qnaBoard);
	public void update(QnaBoard qnaBoard);
	public int updateLikeStatus(Like like);
	public void deleteComment(int commentNo);
	public Map<String, String> insertCommentLike(Like like);
	public Map<String, String> insertCommentDislike(Like like);
	public Map<String, Object> listIsLikedComment(int memberNo);
	public Map<String, Object> listIsDislikedComment(int memberNo);
		
	
}
