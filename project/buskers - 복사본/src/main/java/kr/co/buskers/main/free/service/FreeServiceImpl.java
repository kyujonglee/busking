package kr.co.buskers.main.free.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.buskers.repository.mapper.FreeBoardMapper;

public class FreeServiceImpl implements FreeService {
	@Autowired
	private FreeBoardMapper mapper;
}
