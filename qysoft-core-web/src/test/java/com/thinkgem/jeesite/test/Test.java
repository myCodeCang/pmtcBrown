package com.thinkgem.jeesite.test;

import com.thinkgem.jeesite.common.utils.UtilHelp;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm") ;
		String format = simpleDateFormat.format(new Date());
		System.out.println(format);
		if("14:32".equals(format)){
			System.out.println(100);
		}

		System.out.println(UtilHelp.getRandom(0));
	}
}
