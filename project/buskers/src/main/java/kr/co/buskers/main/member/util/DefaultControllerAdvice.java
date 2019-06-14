package kr.co.buskers.main.member.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.RedirectException;
import org.springframework.beans.BeansException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class DefaultControllerAdvice {
    @ExceptionHandler(RedirectException.class)
    public @ResponseBody Map<String,Object> handleBusinessException(BeansException ex) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("result", ex.getMessage());
        return map;
    }
}