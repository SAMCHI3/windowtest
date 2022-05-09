package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO1;
import com.example.domain.UserVO;

public interface UserDAO {
	public UserVO read(String uid);
	public void update(UserVO vo);
	public void delete(UserVO vo);
	public void insert(UserVO vo);
	public List<UserVO> list(Criteria cri);
	public int total();
	public void lpupdate(ProductVO1 vo,String uid);
}
