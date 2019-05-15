package kr.co.buskers.main.free.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.buskers.repository.domain.FreeBoard;
import kr.co.buskers.repository.domain.FreeBoardComment;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Like;

public interface FreeService {
	public Map<String, Object> list(FreePage freePage);
	public Map<String, Object> sortList(FreePage freePage);
	public Map<String, Object> insertComment(FreeBoardComment freeBoardComment);
	public Map<String, Object> insertReply(FreeBoardComment freeBoardComment);
	public Map<String, Object> updateComment(FreeBoardComment freeBoardComment);
	public Map<String, Object> detail(int boardNo, HttpSession session);
	public Map<String, Object> updateForm(int boardNo);
	public void delete(FreeBoard freeBoard);
	public void write(FreeBoard freeBoard);
	public void update(FreeBoard freeBoard);
	public int updateLikeStatus(Like like);
	public void deleteComment(int commentNo);
	public Map<String, String> insertCommentLike(Like like);
	public Map<String, String> insertCommentDislike(Like like);
	public Map<String, Object> listIsLikedComment(int memberNo);
	public Map<String, Object> listIsDislikedComment(int memberNo);
}
