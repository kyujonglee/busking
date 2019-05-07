package kr.co.buskers.main.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.QnaBoard;
import kr.co.buskers.repository.mapper.QnaBoardMapper;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	
	@Autowired
	private QnaBoardMapper mapper;
	
	public void write(QnaBoard qnaBoard) {
		System.out.println(qnaBoard.getBoardNo());
		System.out.println(qnaBoard.getTitle());
		System.out.println(qnaBoard.getContent());
		System.out.println(qnaBoard.getMemberNo());
		mapper.insertBoard(qnaBoard);
	}
	
	
	
}
