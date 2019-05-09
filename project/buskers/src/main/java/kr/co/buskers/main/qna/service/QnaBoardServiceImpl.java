package kr.co.buskers.main.qna.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.common.page.FreePageResult;
import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.mapper.QnaBoardMapper;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardMapper mapper;
	
	public void write(QnaBoard qnaBoard) {
		mapper.insertBoard(qnaBoard);
	}
	
	public Map<String, Object> list(FreePage freePage) {
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.selectBoard(freePage));
		map.put("pageResult", new FreePageResult(freePage.getPageNo(), mapper.selectBoardCount()));
		return map;
	}
	
	public QnaBoard detail(int no) { 
		return mapper.selectBoardByNo(no);
	}
	public void updateViewCnt(int no) {
		mapper.updateViewCnt(no);
	}

	public void delete(int no) {
		mapper.deleteBoard(no);
	}

	public void update(QnaBoard qnaBoard) {
		mapper.updateBoard(qnaBoard);
	}

	public QnaBoard updateForm(int no) {
		return mapper.selectBoardByNo(no);
	}
}
