package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UsersDao;
import com.mycompany.webapp.dto.Users;

@Service
public class UsersService {
	private static final Logger logger =
			LoggerFactory.getLogger(UsersService.class);
	
	@Autowired
	private UsersDao usersDao;

	public int join(Users user) {
		int result = usersDao.insert(user);
		return result;
	}

	public Users getUserDetail(String userId) {
		Users user = usersDao.selectByUserid(userId);
		return user;
	}
	
	public void updateWithdrawal(String userId, String deleteReason) {
		usersDao.updateWithdrawal(userId ,deleteReason);
	}

	public int changeInfo(Users user) {
		int result = usersDao.update(user);
		return result;
	}

	public String findById(String userName, String userPhone) {
		String id = usersDao.findById(userName, userPhone);
		return id;
	}

}
