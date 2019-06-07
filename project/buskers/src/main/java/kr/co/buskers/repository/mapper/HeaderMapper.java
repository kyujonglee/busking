package kr.co.buskers.repository.mapper;

import java.util.List;

import kr.co.buskers.repository.domain.FreePage;
import kr.co.buskers.repository.domain.Member;
import kr.co.buskers.repository.domain.Message;

public interface HeaderMapper {
	void insertMessage(Message message);
	int selectMemberNoByNickName(String nickName);
	List<Message> selectMessage(FreePage freePage);
	List<Message> selectSentMessage(FreePage freePage);
	void deleteMessageList(Message message);
	void deleteSentMessageList(Message message);
	Message selectMessageByNo(int msgNo);
	void updateMessageReadStatus(int msgNo);
	int selectMessageCount(int memberNo);
	int selectMemberNickName(String nickName);
}
