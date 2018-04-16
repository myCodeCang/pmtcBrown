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
import com.thinkgem.jeesite.modules.user.entity.LccBlock;
import com.thinkgem.jeesite.modules.user.dao.LccBlockDao;

/**
 * 功能Service
 * @author 1
 * @version 2018-01-24
 */
@Service
@Transactional(readOnly = false,propagation= Propagation.REQUIRED,rollbackForClassName={"RuntimeException","Exception","ValidationException"})
public class LccBlockService extends CrudService<LccBlockDao, LccBlock> {

	public LccBlock get(String id) {
		return super.get(id);
	}
	
	public List<LccBlock> findList(LccBlock lccBlock) {
		return super.findList(lccBlock);
	}
	
	public Page<LccBlock> findPage(Page<LccBlock> page, LccBlock lccBlock) {
		return super.findPage(page, lccBlock);
	}
	

	public void save(LccBlock lccBlock) {
		super.save(lccBlock);
	}
	

	public void delete(LccBlock lccBlock) {
		super.delete(lccBlock);
	}
	
}