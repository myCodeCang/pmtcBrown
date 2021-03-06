/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.user.entity.LccTrade;
import com.thinkgem.jeesite.modules.user.dao.LccTradeDao;

/**
 * 交易Service
 * @author luo
 * @version 2018-01-24
 */
@Service
@Transactional(readOnly = false,propagation= Propagation.REQUIRED,rollbackForClassName={"RuntimeException","Exception","ValidationException"})
public class LccTradeService extends CrudService<LccTradeDao, LccTrade> {

	public LccTrade get(String id) {
		return super.get(id);
	}
	
	public List<LccTrade> findList(LccTrade lccTrade) {
		return super.findList(lccTrade);
	}
	
	public Page<LccTrade> findPage(Page<LccTrade> page, LccTrade lccTrade) {
		return super.findPage(page, lccTrade);
	}
	

	public void save(LccTrade lccTrade) {
		super.save(lccTrade);
	}
	

	public void delete(LccTrade lccTrade) {
		super.delete(lccTrade);
	}
	
}