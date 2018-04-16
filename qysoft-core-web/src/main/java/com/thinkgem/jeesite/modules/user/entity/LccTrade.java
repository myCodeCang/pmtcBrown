/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.List;

/**
 * 交易Entity
 * @author luo
 * @version 2018-01-24
 */
public class LccTrade extends DataEntity<LccTrade> {
	
	private static final long serialVersionUID = 1L;
	

	
	private String blockId;		// 区块编号
	private String rollOut;		// 转出总额
	private String hashCodeLeft;		// 哈希值
	private String hashCodeRight;		// 哈希值卖
	private String confirmNum;		// 确认次数
	private List<String> addressLift;
	private List<String> addressRight;

	private long timeOut;


	
	public LccTrade() {
		super();
	}

	public LccTrade(String id){
		super(id);
	}

	@Length(min=0, max=11, message="区块编号长度必须介于 0 和 11 之间")
	public String getBlockId() {
		return blockId;
	}

	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	
	public String getRollOut() {
		return rollOut;
	}

	public void setRollOut(String rollOut) {
		this.rollOut = rollOut;
	}
	
	@Length(min=0, max=50, message="哈希值长度必须介于 0 和 50 之间")
	public String getHashCodeLeft() {
		return hashCodeLeft;
	}

	public void setHashCodeLeft(String hashCodeLeft) {
		this.hashCodeLeft = hashCodeLeft;
	}
	
	@Length(min=0, max=50, message="哈希值卖长度必须介于 0 和 50 之间")
	public String getHashCodeRight() {
		return hashCodeRight;
	}

	public void setHashCodeRight(String hashCodeRight) {
		this.hashCodeRight = hashCodeRight;
	}
	
	@Length(min=0, max=11, message="确认次数长度必须介于 0 和 11 之间")
	public String getConfirmNum() {
		return confirmNum;
	}

	public void setConfirmNum(String confirmNum) {
		this.confirmNum = confirmNum;
	}

	public List<String> getAddressLift() {
		return addressLift;
	}

	public void setAddressLift(List<String> addressLift) {
		this.addressLift = addressLift;
	}

	public List<String> getAddressRight() {
		return addressRight;
	}

	public void setAddressRight(List<String> addressRight) {
		this.addressRight = addressRight;
	}

	public long getTimeOut() {
		return timeOut;
	}

	public void setTimeOut(long timeOut) {
		this.timeOut = timeOut;
	}
}