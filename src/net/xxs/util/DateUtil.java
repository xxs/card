package net.xxs.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
	public static String getNowTime() {
		Date now = new Date();// 声明一个日期[当前日期]
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyyMMddHHmmss");// 添加不同的参数，显示不同格式的日期
		return simpleDateFormat.format(now).toString();
	}
	// 获取当天日期
	public static Date getNowDate() {
		return new Date();
	}
	// 本月的第一天
	public static Date getMonthFirst() {
		Calendar calendar = new GregorianCalendar();
		calendar.set(Calendar.DATE, 1);
		return calendar.getTime();
	}
	// 本月的最后一天
	public static Date getMonthLast() {
		Calendar calendar = new GregorianCalendar();
		calendar.set(Calendar.DATE, 1);
		calendar.roll(Calendar.DATE, -1);
		return calendar.getTime();
	}
	/**
	 * 得到指定月后（前）的日期 参数传负数即可
	 */
	public static Date  getAfterMonth(int month) {
		Calendar c = Calendar.getInstance();//获得一个日历的实例   
		c.setTime(new Date());//设置日历时间   
		c.add(Calendar.MONTH,month);
		return c.getTime();
	}
	/**
	 * 得到指定月后（前）的日期 参数传负数即可
	 */
	public static Date  getAfterDay(int day) {
        Calendar c = Calendar.getInstance();//获得一个日历的实例   
        c.setTime(new Date());//设置日历时间   
        c.add(Calendar.DATE,day);
        return c.getTime();
	}

}
