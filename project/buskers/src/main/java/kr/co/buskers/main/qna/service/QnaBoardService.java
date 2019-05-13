package kr.co.buskers.main.qna.service;

import java.util.List;
import java.util.Map;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.domain.QnaBoardComment;

public interface QnaBoardService {
	public void write(QnaBoard qnaBoard);
	public Map<String,Object> list(FreePage freePage);
	public Map<String, Object> sortList(FreePage freePage);
	public QnaBoard detail(int no);
	public void updateViewCnt(int no);
	public void delete(int no);

	public void update(QnaBoard qnaBoard);
	public QnaBoard updateForm(int no);
	List<QnaBoardComment> commentList(int no);
	List<QnaBoardComment> commentReplyList(int no);
	public void deleteComment(int no);
	
	//좋아요상태 업데이트
	public Map<String,Object> likeStatusUpdate(QnaBoard qnaBoard,int boardType,String likeKind);
	
	public void writeComment(QnaBoardComment qnaBoardComment);
	
}
