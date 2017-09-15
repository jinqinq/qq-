package com.hp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hp.bean.Feel;
import com.hp.bean.Message;
import com.hp.bean.UserBean;
import com.hp.mapper.UserMapper;
import com.hp.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public UserBean finfUserByqq(String qq) {
		return userMapper.finfUserByqq(qq);
	}

	@Override
	public boolean updateUser(UserBean user) {
		//三目运算
		return userMapper.updateUser(user)>0?true:false;
	}

	@Override
	public List<Feel> feellist(Map map) {
		return userMapper.feellist(map);
	}

	@Override
	public Integer addFeel(Feel feel) {
		return userMapper.addFeel(feel);
	}

	@Override
	public Integer regUser(UserBean user) {
		return userMapper.regUser(user);
	}

	@Override
	public Integer delFeel(Integer feelid,Integer userid) {
		Feel feel=new Feel();
		feel.setFeelid(feelid);
		UserBean bean=new UserBean();
		bean.setUserid(userid);
		feel.setUser(bean);
		return userMapper.delFeel(feel);
	}

	@Override
	public List<Message> messagelist(Integer receiveid) {
		return userMapper.messagelist(receiveid);
	}

	@Override
	public Integer addFeel(Message mess) {
		return userMapper.addMess(mess);
	}

	@Override
	public Integer delMess(Integer messid) {
		return userMapper.delMess(messid);
	}

	@Override
	public Integer feelcount(Integer userid) {
		return userMapper.feelcount(userid);
	}
}