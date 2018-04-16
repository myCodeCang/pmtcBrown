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
import com.thinkgem.jeesite.modules.user.entity.LccBlock;
import com.thinkgem.jeesite.modules.user.service.LccBlockService;

/**
 * 功能Controller
 * @author 1
 * @version 2018-01-24
 */
@Controller
@RequestMapping(value = "${adminPath}/user/lccBlock")
public class LccBlockController extends BaseController {

	@Autowired
	private LccBlockService lccBlockService;
	
	@ModelAttribute
	public LccBlock get(@RequestParam(required=false) String id) {
		LccBlock entity = null;
		if (StringUtils2.isNotBlank(id)){
			entity = lccBlockService.get(id);
		}
		if (entity == null){
			entity = new LccBlock();
		}
		return entity;
	}
	
	@RequiresPermissions("user:lccBlock:view")
	@RequestMapping(value = {"list", ""})
	public String list(LccBlock lccBlock, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LccBlock> page = lccBlockService.findPage(new Page<LccBlock>(request, response), lccBlock); 
		model.addAttribute("page", page);
		return "modules/user/lccBlockList";
	}

	@RequiresPermissions("user:lccBlock:view")
	@RequestMapping(value = "form")
	public String form(LccBlock lccBlock, Model model) {
		model.addAttribute("lccBlock", lccBlock);
		return "modules/user/lccBlockForm";
	}

	@RequiresPermissions("user:lccBlock:edit")
	@RequestMapping(value = "save")
	public String save(LccBlock lccBlock, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lccBlock)){
			return form(lccBlock, model);
		}
		lccBlockService.save(lccBlock);
		addMessage(redirectAttributes, "保存1成功");
		return "redirect:"+Global.getAdminPath()+"/user/lccBlock/?repage";
	}
	
	@RequiresPermissions("user:lccBlock:edit")
	@RequestMapping(value = "delete")
	public String delete(LccBlock lccBlock, RedirectAttributes redirectAttributes) {
		lccBlockService.delete(lccBlock);
		addMessage(redirectAttributes, "删除1成功");
		return "redirect:"+Global.getAdminPath()+"/user/lccBlock/?repage";
	}

}