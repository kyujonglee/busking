package kr.co.buskers.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.buskers.repository.mapper.ReservationMapper;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationMapper mapper;
	
	@RequestMapping("/test/test.do")
	public String test() {
		System.out.println(mapper);
		System.out.println(mapper.selectReservation());
		return "redirect:/index.jsp";
	}
}
