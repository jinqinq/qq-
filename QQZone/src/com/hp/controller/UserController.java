package com.hp.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hp.bean.Feel;
import com.hp.bean.Message;
import com.hp.bean.PageBean;
import com.hp.bean.UserBean;
import com.hp.service.UserService;
import com.hp.service.impl.UserServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/")
public class UserController {
	// 自动装配userservice
	@Autowired
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 跳转登录页面
	@RequestMapping("/")
	public String login() {
		return "login";
	}

	// 基本资料
	@RequestMapping("/hostinfor")
	public String hostinfo() {
		return "hostinfor";
	}

	// 留言板
	@RequestMapping("/showMessages")
	public String showMessages(Model model, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("host");
		List<Message> messagelist = userService.messagelist(user.getUserid());
		if (messagelist.size() > 0) {
			model.addAttribute("message", messagelist);
			return "message";
		}
		return "login";
	}

	// 发表留言
	@RequestMapping("/leaveMessage")
	public String leaveMessage(Message mess, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("host");
		mess.setUser(user);
		mess.setReceiveid(user.getUserid());
		mess.setParentmessageid(user.getUserid());
		mess.setMessagetime(new Timestamp(new Date().getTime()));
		Integer i = userService.addFeel(mess);
		if (i > 0) {
			return "redirect:/showMessages";
		} else {
			return "login";
		}
	}

	// 删除留言
	@RequestMapping("/deleteMessage")
	public String delFeel(Message mess, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("host");
		Integer c = userService.delMess(mess.getMessageid());
		if (c > 0) {
			return "redirect:/showMessages";
		} else {
			return "login";
		}
	}
	// 查询说说

	@RequestMapping("/feelindex1")

	public String feelindex1(Model model, String page, HttpSession session, HttpServletResponse response) {
		int size = 3;
		UserBean user = (UserBean) session.getAttribute("host");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", PageBean.countOffset(size, Integer.parseInt(page)));
		map.put("userid",user.getUserid());
		map.put("size", size);
		int allRow = userService.feelcount(user.getUserid()); // 总记录数，通过查询表记录获得
		/*System.out.println(page);*/
		// 总页数
		int totalPage = PageBean.countTotalPage(size, allRow);
		final int offset = PageBean.countOffset(size, Integer.parseInt(page));// 当前页开始记录
		final int length = size; // 每页记录数
		final int currentPage1 = PageBean.countCurrentPage(Integer.parseInt(page));// 当前页
		List list = userService.feellist(map);
		System.out.println(list);
		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(size);
		pageBean.setCurrentPage(currentPage1);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		model.addAttribute("pager", pageBean);
		return "feelindex";
	}

	// 我的说说
	@RequestMapping("/feelmy")
	public String feelmy() {
		return "feelmy";
	}

	// 发表说说
	@RequestMapping("/publishFeel")
	public String publishFeel(Feel feel, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("host");
		feel.setUser(user);
		feel.setFeeltime(new Timestamp(new Date().getTime()));
		Integer i = userService.addFeel(feel);
		if (i > 0) {
			return "redirect:/feelindex";
		} else {
			return "login";
		}
	}

	// 删除说说
	@RequestMapping("/delFeel")
	public String delFeel(Feel fell, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("host");
		Integer c = userService.delFeel(fell.getFeelid(), user.getUserid());
		if (c > 0) {
			return "redirect:/feelindex";
		} else {
			return "login";
		}
	}

	// 主页
	@RequestMapping("/feelallperson")
	public String feelallperson() {
		return "feelallperson";
	}

	// 好友
	@RequestMapping("/showFriends")
	public String showFriends() {
		return "showfriends";
	}

	// 添加好友
	@RequestMapping("/askforfriend")
	public String askforfriend() {
		return "askforfriend";
	}

	// 查找添加好友
	@RequestMapping("/findFriend")
	public String findFriend(UserBean user) {
		UserBean userbean = userService.finfUserByqq(user.getQq());
		return "friendinfo";
	}

	// 登录功能
	@RequestMapping("/login")
	public String logins(UserBean user, HttpServletRequest request) {
		UserBean userbean = userService.finfUserByqq(user.getQq());
		if (userbean != null && userbean.getPassword().equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("host", userbean);
			// 最后一次登录时间
			// 获取当前系统时间
			Date date = new Date();
			// 获取时间戳（数据库中的时间类型，单位秒）
			Timestamp time = new Timestamp(date.getTime());
			// 更新数据库
			userbean.setLastvisit(time);
			// 调用service 更新方法
			boolean flag = userService.updateUser(userbean);
			if (!flag) {
				// 跳转相应的erro页面
				return "error";
			}
			return "index";
		} else {
			return "login";
		}
	}

	// 注册
	@RequestMapping("/register")
	public String register() {
		return "register";
	}

	@RequestMapping("/registervalid")
	public String registervalid(UserBean user, Model model) {
		user.setQq(String.valueOf(new Random().nextInt(1000)));
		user.setHeadpic("static/headpic/20140802211120_t34dW.thumb.224_0.jpeg");
		user.setLastvisit(new Timestamp(new Date().getTime()));
		user.setState(1);
		UserBean userbean = userService.finfUserByqq(user.getQq());
		if (userbean == null) {
			Integer ii = userService.regUser(user);
			if (ii > 0) {
				model.addAttribute("user", user);
			}
			return "register_suc";
		} else {
			return "login";
		}

	}

	@RequestMapping("/update")
	public String update() {
		return "updateheadpic";
	}

	@RequestMapping("/updateheadpic")
	public String updateheadpic() {
		return "index";
	}
}
