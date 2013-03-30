package net.xxs.listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import net.xxs.bean.Setting;
import net.xxs.entity.Member;
import net.xxs.util.DateUtil;
import net.xxs.util.SettingUtil;

/**
 * 监听器 - 记录登陆用户
 */

public class SessionListener implements HttpSessionAttributeListener  {

    /**  
     * 定义存储客户登录session的集合.  
     */  
    private static List sessions = new ArrayList();   
  
    /**  
     * 加入session时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */  
    public void attributeAdded(HttpSessionBindingEvent sbe) {   
        if (Member.MEMBER_ID_SESSION_NAME.equals(sbe.getName())) {   
            sessions.add(sbe.getValue());   
        }   
        Setting setting = SettingUtil.getSetting();
        int oldcount = setting.getOnLineMaxCount();
        int newcount = getSessions().size() ;
        if(oldcount<newcount){
        	setting.setOnLineMaxCount(newcount);
        	setting.setOnLineMaxCountDate(DateUtil.getDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
    		SettingUtil.updateSetting(setting);
        }
		
    }   
  
    /**  
     * session失效时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */  
    public void attributeRemoved(HttpSessionBindingEvent sbe) {   
        if (Member.MEMBER_ID_SESSION_NAME.equals(sbe.getName())) {   
            sessions.remove(sbe.getValue());   
        }   
    }   
  
    /**  
     * session覆盖时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */  
    public void attributeReplaced(HttpSessionBindingEvent sbe) {   
    }   
  
    /**  
     * 返回客户登录session的集合.  
     *   
     * @return  
     */  
    public static List getSessions() {   
        return sessions;   
    }   

}