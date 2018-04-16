/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.user.entity.LccTrade;

/**
 * 交易DAO接口
 * @author luo
 * @version 2018-01-24
 */
@MyBatisDao
public interface LccTradeDao extends CrudDao<LccTrade> {
	
}