package com.hp.service;

import java.util.List;
import java.util.Map;

import com.hp.bean.Feel;
import com.hp.bean.Message;
import com.hp.bean.UserBean;

public interface UserService {
	public UserBean finfUserByqq(String qq);
	public boolean updateUser(UserBean user);
	public List<Feel> feellist(Map map);//查询说说
	public Integer feelcount(Integer userid);
	public Integer addFeel(Feel feel);//添加说说
	public Integer regUser(UserBean user);//注册
	public Integer delFeel(Integer feelid,Integer userid);//删除说说
	public List<Message> messagelist(Integer receiveid);//查询留言
	public Integer addFeel(Message mess);//添加留言
	public Integer delMess(Integer messid);//删除留言
}
