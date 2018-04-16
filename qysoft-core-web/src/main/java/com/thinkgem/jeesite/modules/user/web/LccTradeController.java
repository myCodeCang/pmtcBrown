/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils2;
import com.thinkgem.jeesite.modules.user.entity.LccTrade;
import com.thinkgem.jeesite.modules.user.service.LccTradeService;

/**
 * 交易Controller
 * @author luo
 * @version 2018-01-24
 */
@Controller
@RequestMapping(value = "${adminPath}/user/lccTrade")
public class LccTradeController extends BaseController {

	@Autowired
	private LccTradeService lccTradeService;
	
	@ModelAttribute
	public LccTrade get(@RequestParam(required=false) String id) {
		LccTrade entity = null;
		if (StringUtils2.isNotBlank(id)){
			entity = lccTradeService.get(id);
		}
		if (entity == null){
			entity = new LccTrade();
		}
		return entity;
	}
	
	@RequiresPermissions("user:lccTrade:view")
	@RequestMapping(value = {"list", ""})
	public String list(LccTrade lccTrade, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LccTrade> page = lccTradeService.findPage(new Page<LccTrade>(request, response), lccTrade); 
		model.addAttribute("page", page);
		return "modules/user/lccTradeList";
	}

	@RequiresPermissions("user:lccTrade:view")
	@RequestMapping(value = "form")
	public String form(LccTrade lccTrade, Model model) {
		model.addAttribute("lccTrade", lccTrade);
		return "modules/user/lccTradeForm";
	}

	@RequiresPermissions("user:lccTrade:edit")
	@RequestMapping(value = "save")
	public String save(LccTrade lccTrade, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lccTrade)){
			return form(lccTrade, model);
		}
		lccTradeService.save(lccTrade);
		addMessage(redirectAttributes, "保存无成功");
		return "redirect:"+Global.getAdminPath()+"/user/lccTrade/?repage";
	}
	
	@RequiresPermissions("user:lccTrade:edit")
	@RequestMapping(value = "delete")
	public String delete(LccTrade lccTrade, RedirectAttributes redirectAttributes) {
		lccTradeService.delete(lccTrade);
		addMessage(redirectAttributes, "删除无成功");
		return "redirect:"+Global.getAdminPath()+"/user/lccTrade/?repage";
	}

}