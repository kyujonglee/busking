package kr.co.buskers.main.free.service;

import java.util.Map;

import kr.co.buskers.repository.domain.FreePage;

public interface FreeService {
	public Map<String, Object> list(FreePage freePage);
}