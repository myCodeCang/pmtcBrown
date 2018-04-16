/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.*;

/**
 * 功能Entity
 * @author 1
 * @version 2018-01-24
 */
public class LccBlock extends DataEntity<LccBlock> {
	
	private static final long serialVersionUID = 1L;
	

	
	private String tradeNum;		// 交易次数
	private String allSend;		// 总发送额
	private String dataSize;		// 数据量
	private String degreeDifficulty;		// 难度系数
	private String random;		// 随机数
	private String hashCode;		// 哈希值
	private List<String> addressLift;
	private List<String> addressRight;
	
	public LccBlock() {
		super();
	}

	public LccBlock(String id){
		super(id);
	}

	@Length(min=0, max=11, message="交易次数长度必须介于 0 和 11 之间")
	public String getTradeNum() {
		return tradeNum;
	}

	public void setTradeNum(String tradeNum) {
		this.tradeNum = tradeNum;
	}
	
	public String getAllSend() {
		return allSend;
	}

	public void setAllSend(String allSend) {
		this.allSend = allSend;
	}
	
	@Length(min=0, max=11, message="数据量长度必须介于 0 和 11 之间")
	public String getDataSize() {
		return dataSize;
	}

	public void setDataSize(String dataSize) {
		this.dataSize = dataSize;
	}
	
	public String getDegreeDifficulty() {
		return degreeDifficulty;
	}

	public void setDegreeDifficulty(String degreeDifficulty) {
		this.degreeDifficulty = degreeDifficulty;
	}
	
	@Length(min=0, max=11, message="随机数长度必须介于 0 和 11 之间")
	public String getRandom() {
		return random;
	}

	public void setRandom(String random) {
		this.random = random;
	}
	
	@Length(min=0, max=50, message="哈希值长度必须介于 0 和 50 之间")
	public String getHashCode() {
		return hashCode;
	}

	public void setHashCode(String hashCode) {
		this.hashCode = hashCode;
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



}