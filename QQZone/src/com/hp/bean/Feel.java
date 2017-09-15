package com.hp.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Feel {
	private Integer feelid;
	private UserBean user;
	private Date feeltime;
	private String feelcontent;
	private String pic;
	public Integer getFeelid() {
		return feelid;
	}
	public void setFeelid(Integer feelid) {
		this.feelid = feelid;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public Date getFeeltime() {
		return feeltime;
	}
	public void setFeeltime(Date feeltime) {
		this.feeltime = feeltime;
	}
	public String getFeelcontent() {
		return feelcontent;
	}
	public void setFeelcontent(String feelcontent) {
		this.feelcontent = feelcontent;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
}
