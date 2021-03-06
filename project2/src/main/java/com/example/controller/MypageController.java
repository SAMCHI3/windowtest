package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.MypageDAO;
import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MypageDAO dao;
	
	@RequestMapping("/llist.json")
	@ResponseBody
	public Map<String,Object> llistJSON(String lid){
		HashMap<String, Object> map=new HashMap<>();
		map.put("llist", dao.llist(lid));
		return map;
	}
	
	@RequestMapping("/slist.json")
	@ResponseBody
	public Map<String,Object> slistJSON(String sid){
		HashMap<String, Object> map=new HashMap<>();
		map.put("slist", dao.slist(sid));
		return map;
	}
	
	@RequestMapping("/slist1.json")
	@ResponseBody
	public Map<String,Object> slist1JSON(String sid){
		HashMap<String, Object> map=new HashMap<>();
		map.put("slist1", dao.slist1(sid));
		return map;
	}
	
	@RequestMapping("/blist.json")
	@ResponseBody
	public Map<String,Object> blistJSON(String bid){
		HashMap<String, Object> map=new HashMap<>();
		map.put("blist", dao.blist(bid));
		return map;
	}
	
	@RequestMapping("/blist1.json")
	@ResponseBody
	public Map<String,Object> blist1JSON(String bid){
		HashMap<String, Object> map=new HashMap<>();
		map.put("blist1", dao.blist1(bid));
		return map;
	}
}
