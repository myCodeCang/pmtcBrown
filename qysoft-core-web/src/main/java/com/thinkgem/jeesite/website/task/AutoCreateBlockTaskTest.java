package com.thinkgem.jeesite.website.task;

import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.UtilHelp;
import com.thinkgem.jeesite.modules.user.dao.LccBlockDao;
import com.thinkgem.jeesite.modules.user.entity.LccBlock;
import com.thinkgem.jeesite.modules.user.entity.LccTrade;
import com.thinkgem.jeesite.modules.user.entity.UserUserinfo;
import com.thinkgem.jeesite.modules.user.service.LccTradeService;
import com.thinkgem.jeesite.modules.user.service.UserUserinfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 *
 */
@Service
public class AutoCreateBlockTaskTest {

    private static List<UserUserinfo> userinfos ;
    @Resource
    private LccBlockDao lccBlockDao;
    @Resource
    private UserUserinfoService userUserinfoService ;
    @Resource
    private LccTradeService lccTradeService;

    private static Logger logger =LoggerFactory.getLogger(AutoCreateBlockTaskTest.class);


    @Scheduled(cron="0 0 1 * * ?")
    public void updateUserList(){
        userinfos = userUserinfoService.findList(new UserUserinfo());
    }

    @Scheduled(cron="0/33 * * * * ? ")
    public void createBlock() {

        if(UtilHelp.getRandom(10)>5){
            return;
        }
        logger.error("start..................");

        LccBlock block = new LccBlock();
        block.setId(IdGen.uuid("seq_helpMate"));
        block.setTradeNum(UtilHelp.getRandomString(15));
        int temp = UtilHelp.getRandom(100);
        block.setAllSend(temp+"."+UtilHelp.getRandomString(10000));
        block.setDataSize(temp*10+"");
        block.setDegreeDifficulty("0.00"+UtilHelp.getRandomString(1000000));
        block.setCreateDate(new Date());
        lccBlockDao.insert(block);


        //获取用户
        List<UserUserinfo> userinfos = userUserinfoService.findList(new UserUserinfo());
        LccTrade lccTrade = new LccTrade();
        lccTrade.setBlockId(block.getId());
        lccTrade.setRollOut(UtilHelp.getRandomString(100)+"."+UtilHelp.getRandomString(100000));
        lccTrade.setHashCodeLeft("新区块奖励");
        lccTrade.setHashCodeRight(userinfos.get(UtilHelp.getRandom(userinfos.size()-1)).getRemarks());
        lccTrade.setConfirmNum(UtilHelp.getRandomString(5));
        lccTradeService.save(lccTrade);

        logger.error("生存block成功");

    }

    @Scheduled(cron="0/17 * * * * ? ")
    public void createTrade() {

        if(UtilHelp.getRandom(10)>5){
            return;
        }

        logger.error("start..................");

        if(userinfos == null){
            userinfos = userUserinfoService.findList(new UserUserinfo());
        }
        List<LccBlock> lccBlocks = lccBlockDao.findList(new LccBlock());
        if(lccBlocks.size()==0){
            logger.error("暂无区块");
            return;
        }



        LccTrade lccTrade = new LccTrade();
        lccTrade.setBlockId(lccBlocks.get(UtilHelp.getRandom(lccBlocks.size()-1)).getId());
        lccTrade.setRollOut(UtilHelp.getRandomString(100)+"."+UtilHelp.getRandomString(100000));
        lccTrade.setHashCodeLeft(userinfos.get(UtilHelp.getRandom(userinfos.size()-1)).getRemarks());
        lccTrade.setHashCodeRight(userinfos.get(UtilHelp.getRandom(userinfos.size()-1)).getRemarks());
        lccTrade.setConfirmNum(UtilHelp.getRandomString(5));
        lccTradeService.save(lccTrade);

        logger.error("....success");
    }


}
