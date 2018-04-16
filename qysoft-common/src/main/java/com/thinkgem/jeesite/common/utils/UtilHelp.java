package com.thinkgem.jeesite.common.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UtilHelp {

    public static int getRandom(int temp) {
        return (int) (Math.random() * temp);
    }

    public static String getRandomString(int temp) {
        return String.valueOf((int)(Math.random() * temp));
    }

    public static void main(String[] args) {
        System.out.println((int)(Math.random()*100));
    }

    /**
     * 判断是否含有特殊字符
     *
     * @param str
     * @return true为包含，false为不包含
     */
    public static boolean isSpecialChar(String str) {
        String regEx = "[ _`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]|\n|\r|\t";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.find();
    }

}
