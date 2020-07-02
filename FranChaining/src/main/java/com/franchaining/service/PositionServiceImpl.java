package com.franchaining.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.franchaining.dao.ManagerDAO;

@Service
public class PositionServiceImpl {
	
	@Inject
	private ManagerDAO dao;
	
}
