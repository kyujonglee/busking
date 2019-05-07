package kr.co.buskers.main.free.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.buskers.repository.mapper.FreeBoardMapper;

@Service
public class FreeServiceImpl implements FreeService {
	@Autowired
	private FreeBoardMapper mapper;
}
