package kr.co.buskers.repository.mapper;

import kr.co.buskers.repository.domain.Message;

public interface HeaderMapper {
	void insertMessage(Message message);
	int selectMemberNoByNickName(String nickName);
}
