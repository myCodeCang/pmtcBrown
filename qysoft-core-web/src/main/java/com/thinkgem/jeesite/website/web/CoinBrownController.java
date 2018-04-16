/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.website.web;

import com.thinkgem.jeesite.common.utils.DateUtils2;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils2;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.user.dao.UserUserinfoDao;
import com.thinkgem.jeesite.modules.user.entity.LccBlock;
import com.thinkgem.jeesite.modules.user.entity.LccTrade;
import com.thinkgem.jeesite.modules.user.entity.UserUserinfo;
import com.thinkgem.jeesite.modules.user.service.LccBlockService;
import com.thinkgem.jeesite.modules.user.service.LccTradeService;
import com.thinkgem.jeesite.modules.user.service.UserUserinfoService;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 浏览器BBP
 *
 * @author LUO
 * @version 1.0.0
 */
@Controller
@RequestMapping(value = "${frontPath}/coin")
public class CoinBrownController extends BaseController {

    @Resource
    private LccBlockService lccBlockService;
    @Resource
    private LccTradeService lccTradeService;
    @Resource
    private UserUserinfoService userUserinfoService;
    @Resource
    private UserUserinfoDao userUserinfoDao;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpServletRequest request, HttpServletResponse response, Model model) {

        LccBlock block = new LccBlock();
        block.setOrderBy("a.createDate desc limit 6");
        List<LccBlock> blocks = lccBlockService.findList(block);
        if(blocks.size()==0){
            return "modules/coin/index";
        }
        LccTrade trade = new LccTrade();
        trade.setOrderBy("a.createDate desc limit 9");
        List<LccTrade> trades = lccTradeService.findList(trade);
        Object attribute = request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        if(attribute != null  && "en_US".equals(attribute.toString())){

            for (LccTrade coin:trades){
                if("新区块奖励".equals(coin.getHashCodeLeft())){
                    coin.setHashCodeLeft("Newly Generated Coins");
                }
            }
        }
        if(attribute != null  && "zh_HK".equals(attribute.toString())){
            for (LccTrade coin:trades){
                if("新区块奖励".equals(coin.getHashCodeLeft())){
                    coin.setHashCodeLeft("新區塊獎勵");
                }
            }
        }

        for (LccTrade coin:trades){
            long pastMinutes = DateUtils2.pastMinutes(coin.getCreateDate());
            coin.setTimeOut(pastMinutes);
        }

        List<UserUserinfo> userinfos = userUserinfoDao.allMoneySort();

        model.addAttribute("userList",userinfos);
        model.addAttribute("difficult", blocks.get(0).getDegreeDifficulty());
        model.addAttribute("waiteTradeNum",blocks.get(0).getTradeNum());
        model.addAttribute("blockList", blocks);
        model.addAttribute("tradeList", trades);
        return "modules/coin/index";
    }

    @RequestMapping(value = "/top", method = RequestMethod.GET)
    public String top(HttpServletRequest request, HttpServletResponse response, Model model) {

        List<UserUserinfo> userinfos = userUserinfoDao.allMoneySort();
        model.addAttribute("userList", userinfos);
        return "modules/coin/top";
    }

    @RequestMapping(value = "/trade", method = RequestMethod.GET)
    public String trade(HttpServletRequest request, HttpServletResponse response, Model model) {
        String tradeId = request.getParameter("tradeId");
        LccTrade trade = lccTradeService.get(tradeId);

        String haseCode = Encodes.encodeBase64(trade.getHashCodeLeft());
        Object attribute = request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        if(attribute != null  && "en_US".equals(attribute.toString())){
                if("新区块奖励".equals(trade.getHashCodeLeft())){
                    trade.setHashCodeLeft("Newly Generated Coins");
                }
        }
        if(attribute != null  && "zh_HK".equals(attribute.toString())){
                if("新区块奖励".equals(trade.getHashCodeLeft())){
                    trade.setHashCodeLeft("新區塊獎勵");
                }
        }


        model.addAttribute("trade", trade);
        model.addAttribute("hashCode",haseCode);
        return "modules/coin/trade";
    }

    @RequestMapping(value = "/address", method = RequestMethod.GET)
    public String address(HttpServletRequest request, HttpServletResponse response, Model model) {
        String address = request.getParameter("address");

        UserUserinfo userinfo = userUserinfoService.getByRemarks(address);
        if(userinfo == null){
            index(request,response,model);
        }
        LccTrade trade = new LccTrade();
        trade.setHashCodeLeft(address);
        List<LccTrade> lccTrades = lccTradeService.findList(trade);
        BigDecimal allMoney = lccTrades.stream().map(p -> new BigDecimal(p.getRollOut())).reduce(BigDecimal.ZERO, BigDecimal::add);
        model.addAttribute("address",address);
        model.addAttribute("allMoney",allMoney);
        model.addAttribute("num",lccTrades.size());

        model.addAttribute("money",userinfo.getMoney());
        model.addAttribute("lccTrades", lccTrades);
        return "modules/coin/address";

    }



    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(HttpServletRequest request, HttpServletResponse response, Model model) {
        String address = request.getParameter("search");
        UserUserinfo userinfo = userUserinfoService.getByRemarks(address);
        if(userinfo == null){
            model.addAttribute("message","占位符");
            return "forward:index";
        }

        LccTrade trade = new LccTrade();
        trade.setHashCodeLeft(address);
        List<LccTrade> lccTrades = lccTradeService.findList(trade);
        BigDecimal allMoney = lccTrades.stream().map(p -> new BigDecimal(p.getRollOut())).reduce(BigDecimal.ZERO, BigDecimal::add);
        model.addAttribute("address",address);
        model.addAttribute("allMoney",allMoney);
        model.addAttribute("num",lccTrades.size());

        model.addAttribute("money",userinfo.getMoney2());
        model.addAttribute("lccTrades", lccTrades);

        return "modules/coin/address";

    }

    @RequestMapping(value = "language", method = RequestMethod.GET)
    public String language(HttpServletRequest request, HttpServletResponse response) {
        String langType = request.getParameter("type");
        if(langType==null||langType.equals("")){
            return "forward:index";
        }else{
            if (langType.equals("zh_CN")) {
                Locale locale1 = new Locale("zh", "CN");
                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale1);
            } else if (langType.equals("en_US")) {
                Locale locale1 = new Locale("en", "US");
                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale1);
            }else if (langType.equals("zh_HK")){
                Locale locale1 = new Locale("zh", "HK");
                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale1);
            }else {
                request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, LocaleContextHolder.getLocale());
            }
        }

        return "forward:index";
    }


}
