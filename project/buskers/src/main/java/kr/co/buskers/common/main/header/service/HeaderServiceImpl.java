package kr.co.buskers.common.main.header.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.Message;
import kr.co.buskers.repository.mapper.HeaderMapper;

@Service
public class HeaderServiceImpl implements HeaderService {
	
	@Autowired
	private HeaderMapper mapper;
	
	public Map<String, Object> list(FreePage freePage, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = (Member)session.getAttribute("user");
		
		freePage.setReceiverMemberNo(member.getMemberNo());
		map.put("message", mapper.selectMessage(freePage));
		freePage.setSenderMemberNo(member.getMemberNo());
		map.put("sentMessage", mapper.selectSentMessage(freePage));
		return map;
	}	
	
	public Map<String, Object> selectAlarmList(HttpSession session, int index) {
		Map<String, Object> map = new HashMap<>();
		if (session.getAttribute("user") != null) {
			Map<String, Object> m = new HashMap<>();
			Member member = (Member)session.getAttribute("user");
			m.put("memberNo", member.getMemberNo());
			m.put("index",index);
			map.put("alarm", mapper.selectAlarmList(m));
		}
		return map;
	}
	
	public void write(Message message) {
		message.setReceiverMemberNo(mapper.selectMemberNoByNickName(message.getNickName()));
		mapper.insertMessage(message);
	}
	
	public void deleteMessage(int[] msgNo) {
		Message message = new Message();
		message.setMsgNos(msgNo);
		
		mapper.deleteMessageList(message);
	}
	
	public void deleteSentMessage(int[] msgNo) {
		Message message = new Message();
		message.setMsgNos(msgNo);
		
		mapper.deleteSentMessageList(message);
	}
	
	public int selectMessageCount(HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		
		return mapper.selectMessageCount(member.getMemberNo());
	}
	
	public int selectAlarmCount(HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		
		return mapper.selectAlarmCount(member.getMemberNo());
	}
	
	public Map<String, Object> detail(int msgNo) {
		Map<String, Object> map = new HashMap<>();
		
		mapper.updateMessageReadStatus(msgNo);
		
		map.put("message", mapper.selectMessageByNo(msgNo));
		
		return map;
	}

	@Override
	public int selectMemberNickName(String nickName) {
		return mapper.selectMemberNickName(nickName);
	}
}


