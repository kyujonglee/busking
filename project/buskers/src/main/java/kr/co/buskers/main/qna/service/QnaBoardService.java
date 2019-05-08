package kr.co.buskers.main.qna.service;

import java.util.Map;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.QnaBoard;

public interface QnaBoardService {
	public void write(QnaBoard qnaBoard);
	public Map<String,Object> list(FreePage freePage);
}
