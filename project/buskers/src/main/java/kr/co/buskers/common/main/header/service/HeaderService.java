package kr.co.buskers.common.main.header.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Message;

public interface HeaderService {
	public void write(Message message);
	public Map<String, Object> list(FreePage freePage, HttpSession session);
	public void deleteMessage(int[] msgNos);
	public void deleteSentMessage(int[] msgNos);
	public Map<String, Object> detail(int msgNo);
	public int selectMessageCount(HttpSession session);
	public int selectMemberNickName(String nickName);
	public Map<String, Object> selectAlarmList(HttpSession session);
}
