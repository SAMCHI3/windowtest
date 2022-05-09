package com.example.service;

import com.example.domain.ProductVO1;
import com.example.domain.UserVO;

public interface LikesService {
	public void lpupdate(ProductVO1 vo,String pmodel,String lmodel,int lno,String lpcnt);
	public void lpinsert(ProductVO1 vo,String pmodel,String lmodel, int lno,String lpcnt);
	public void lpupdate1(ProductVO1 vo,String pmodel,String lmodel,int lno,String lpcnt);
}
