package kr.co.buskers.common.main.header.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.domain.Message;
import kr.co.buskers.repository.mapper.HeaderMapper;

@Service
public class HeaderServiceImpl implements HeaderService {
	
	@Autowired
	private HeaderMapper mapper;
	
	public void write(Message message) {
		message.setReceiverMemberNo(mapper.selectMemberNoByNickName(message.getNickName()));
		mapper.insertMessage(message);
	}
}
